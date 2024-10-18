-- CreateTable
CREATE TABLE "zapRun" (
    "id" TEXT NOT NULL,
    "zapId" TEXT NOT NULL,

    CONSTRAINT "zapRun_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "zapRunOutbox" (
    "id" TEXT NOT NULL,
    "zapRunId" TEXT NOT NULL,

    CONSTRAINT "zapRunOutbox_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "zapRunOutbox_zapRunId_key" ON "zapRunOutbox"("zapRunId");

-- AddForeignKey
ALTER TABLE "zapRun" ADD CONSTRAINT "zapRun_zapId_fkey" FOREIGN KEY ("zapId") REFERENCES "Zap"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "zapRunOutbox" ADD CONSTRAINT "zapRunOutbox_zapRunId_fkey" FOREIGN KEY ("zapRunId") REFERENCES "zapRun"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
