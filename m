Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF967EAC34
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Nov 2023 09:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C9510E1DF;
	Tue, 14 Nov 2023 08:56:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DBC10E1DA
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Nov 2023 08:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2/5qzynIKypPR+UV2FOHhIqRCPGKXXiJx2og5InavQKYjQ1A0qpS/O1V6z/yyoU1koAmusjh7G+11qwsAETZu7joe39c7dQ1y56+tZlhYRIIrxiJJb7fPHNgfPIiTVfU1zPHOysF3zCi3jtdD/A4SerjiQn1hsMc5uTnDrEk0nDYphV4CApNl74uYEk9BJOkxf5Qtm+BB1w0NzOeePCjRICIXcpuocI4GfencL9kj7OZ5mbMHXFjgidwYFNIC0ZkCT64IUAfMADzZGxxV3PlKyxQoOUrhYi3zwHUVf60efvpW4jHzHqsGdrfXANIba3hqpt+uCkrBpUoL/RWtJjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF14W7Us2ZTI4Tvxba5O9rOYYit6gt7gYr8dAveyOSk=;
 b=bS4GhSF6BNJcak0K7SiAdXJE72dXBZHVdU84Ui1eaF1GNLl2lOBcaSdgr3+M8Omh9R2ceoygaqJp+83ADwbck/rZw4lyrnh/ZHbCoglko5bYSr+AvTsYFjWYZB1uz5dDpcQPPyAelop6a6kWHddrYha3bCBmOP1cP/LHdoa1GRKswvFb/7esxVYUDuq8Ujm2mctelY4xAlNLYR2ot/Wn60JyFPtbdRb6+v8xvys8zTuJMKcGhAWyqnKfGWUUHeS5l0LcaK8I1gz2+RUdYAfmXemjdIotcZkVWIIP2Zf4P5exNsr/k1uxicQQfjojX7NFsnM7VLl17IxAmGDiRAUZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF14W7Us2ZTI4Tvxba5O9rOYYit6gt7gYr8dAveyOSk=;
 b=gvFekLRBBsT4cdSi1lPjJp9aRFWcuwliBUqgQug0bi6Cp4726zd9WvsBfhZWoix4gJrcuilImKvY9cT97q/PJ4KRvcwOu8YMbXDfNLasevboYF2k8hqpxsPb/Hlz9jzt6u1tQRP4ijzHjcHuUUROmqVOPb/z4g5NKO+Il6PfnRc=
Received: from CH0PR13CA0042.namprd13.prod.outlook.com (2603:10b6:610:b2::17)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 08:56:16 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::ed) by CH0PR13CA0042.outlook.office365.com
 (2603:10b6:610:b2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17 via Frontend
 Transport; Tue, 14 Nov 2023 08:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.17 via Frontend Transport; Tue, 14 Nov 2023 08:56:15 +0000
Received: from asad-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 14 Nov
 2023 02:56:08 -0600
From: Asad Kamal <asad.kamal@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/pm: Fill pcie error counters for gpu v1_4
Date: Tue, 14 Nov 2023 16:55:35 +0800
Message-ID: <20231114085535.151807-2-asad.kamal@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114085535.151807-1-asad.kamal@amd.com>
References: <20231114085535.151807-1-asad.kamal@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: ce139b3d-6c72-46c3-0c2a-08dbe4ef8f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hr2UIFUZ2iWa7pDsGfYjrhKoCl/MMeubnDTUcxwLmc8gJ7SF4QdScl/3dTzi9V6HLeswqCuRJVdWGRb1/hznXHwiowwVeUFfPIN76rmNm2PTEVrCsRxSIuH6kBiqocxbb/6Q0RoFpP6auOS/eAH6JAn1z9EELiWSJajPNh2CC7QPbc4rgNbozU2fEX2r5XDgi1g+ShcWJtfkrMD8aIqsyE5IJeQ2fYctd3esVTeoUK7UvL2XVnlQKxOqfENHKSUtYVLGjnbwwZS19ynji/E3E4JBcBjp0n4PeXJ5VNck9LUq7mj2/vIzTjXXJXr4fVzucOToPAdxKW0T0J+UqqImnwb5i7DxBrUBCbzR1Wpn6l1UlNPLo6T4zFxRXRPDDdmNHXDfm5oXsxuzj9rToWUplJGHYGMlCFSZaMLxuQteGTlbGYIBncBx9kzFdlt6ExqBDSS2zXa80R4y3EgTBiDDloxjAyyLvjRWjvM23AQSWOzPqskizLvxRSMoztaMgHvX+6D/kazWhoJvwla60Zl8pjQp5Exmybz6pC+YCh7xNoQKb8rSpJNZ+PBoeVc7kIkgmnnceqXxFe8YdowOiKkc84ykBs3FGqWdt4Z0wl4D5hXpY9oYUTr/TSrKWgvJI0Do9E4Npl84BElGZMUUIgbPmvB3SfiUWpwtoaswJi2JFB27738tLSmG4bqLcOaUKl9rEovn1uQ1VQQMrXZ7wQNCj3D7ChVfb2fVX4JJjfES8BR2x5JzLH10Wk+HgeEGNAnmKoS012RqRE76xuerBNiNJw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(82310400011)(451199024)(186009)(64100799003)(1800799009)(40470700004)(46966006)(36840700001)(1076003)(5660300002)(44832011)(2616005)(16526019)(7696005)(40480700001)(26005)(6666004)(2906002)(336012)(426003)(83380400001)(81166007)(6916009)(478600001)(356005)(54906003)(316002)(70586007)(70206006)(41300700001)(8936002)(4326008)(36756003)(8676002)(40460700003)(82740400003)(86362001)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 08:56:15.9371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce139b3d-6c72-46c3-0c2a-08dbe4ef8f93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: le.ma@amd.com, Lijo.Lazar@amd.com, asad.kamal@amd.com, shiwu.zhang@amd.com,
 hawking.zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fill PCIE error counters & instantaneous bandwidth
in gpu metrics v1_4 for smu v_13_0_6

Signed-off-by: Asad Kamal <asad.kamal@amd.com>
Reviewed-by: Le Ma <le.ma@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index e03d93d2e5d0..6daa8ee49035 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -2095,6 +2095,14 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
 			smu_v13_0_6_get_current_pcie_link_speed(smu);
 		gpu_metrics->pcie_bandwidth_acc =
 				SMUQ10_ROUND(metrics->PcieBandwidthAcc[0]);
+		gpu_metrics->pcie_bandwidth_inst =
+				SMUQ10_ROUND(metrics->PcieBandwidth[0]);
+		gpu_metrics->pcie_l0_to_recov_count_acc =
+				metrics->PCIeL0ToRecoveryCountAcc;
+		gpu_metrics->pcie_replay_count_acc =
+				metrics->PCIenReplayAAcc;
+		gpu_metrics->pcie_replay_rover_count_acc =
+				metrics->PCIenReplayARolloverCountAcc;
 	}
 
 	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
-- 
2.42.0

