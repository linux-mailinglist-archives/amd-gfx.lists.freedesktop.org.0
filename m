Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4040D379F80
	for <lists+amd-gfx@lfdr.de>; Tue, 11 May 2021 08:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36486E9C2;
	Tue, 11 May 2021 06:04:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E242E6E9C2
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 May 2021 06:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeUPWD0ewbT+JXUW5fNUQ2yikv7immc+KRvg4OFJH0MrkF2V65LRM8LY5sRXEqo+ixYB8R3nmCza8hVMwITfRJSkGYerk9m5U1cqVUEGCQM4gjt0vlw8EpYg7ehGkVIeUxY5CFcCxe4mekqtSkkKt51W6fZN62dKr8ltuIcgO/4XaILz4XiIyjVQRA4a8cqLOUNlY2Efc+qlyHlh83VrgDyTutg+X3WKlhA6bdOGdav0WfhQ4Ay4OZ9Rew2Q2YbNBqyoMBeidown+9TKoLel6Yu7L+X4trph36xHYI7FLhvABg1j2Lh1T+8a3vg7vVRg2MG//6sDAnJgOItnrfvH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM9zIsAKOdipY9sgd5znVgk0CfdC5wHClGRBNQtcbZA=;
 b=dvVx7aTT7LedZxicgu+MAH8Ajpr8qitvtlIPkLGana1AHAc9sXLr+oMY8RJ0VRQkAJQFWbGHUkVpLbMdComLKnJnn9QO3GB2n0ySNp4l5PK9kkZZKDpONwpwGvYj8WCeYE2O3Mmp41uS0x5tj0n7aifY7UqZ0FSRi5isUbyJnsHrHGDCbY2TXyFqpOz/cC87eH0RLfjncsQwcJ0+02BLEao5NvCv/82P8ASF6H3sz7S5zL8JVSZ/PAcF4+zOE6qfOT5GWr1c+o58YMacuPF1LALM7xi3Ggg3l5IxVYyPlVz1LU0jwVp3viFFKTqhDYVryhuxThspWKCe+q1UV8f+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM9zIsAKOdipY9sgd5znVgk0CfdC5wHClGRBNQtcbZA=;
 b=Z5QWruvZJYOGR6vGoLEkUE7z25DeBHrbUBeTyDLPU8Vwsy6R4e0Msp729BOOQp4saDltej+ofm/7a4OQvXkcan93uzVdiayOPWWIuQu6CQyizNEpPX+3Mh6VFVY1vHpCEcS7MzJiSogfbkcYP+wBxaP0fE+fxPOUC3z0DHbB4cU=
Received: from MWHPR17CA0064.namprd17.prod.outlook.com (2603:10b6:300:93::26)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 06:04:32 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:93:cafe::87) by MWHPR17CA0064.outlook.office365.com
 (2603:10b6:300:93::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 11 May 2021 06:04:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 06:04:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 01:04:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 01:04:31 -0500
Received: from yajunl-gv.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 01:04:29 -0500
From: Dennis Li <Dennis.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Alexander.Deucher@amd.com>,
 <felix.kuehling@amd.com>, <Hawking.Zhang@amd.com>, <christian.koenig@amd.com>
Subject: [PATCH] drm/amdgpu: add synchronization among waves in the same
 threadgroup
Date: Tue, 11 May 2021 14:04:20 +0800
Message-ID: <20210511060420.30820-1-Dennis.Li@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c781e304-3d7b-49f8-b588-08d91442a54b
X-MS-TrafficTypeDiagnostic: CO6PR12MB5441:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54416F8351A285ADDE474ED8ED539@CO6PR12MB5441.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aGkNrEbKJwtubtr6QtfjC/lLi7c0AwCAi1dDz+CevWRM8t40SIEF31VUgwXfQFN7Wm4XdYdBVhNlQ/JOlY8VF3mMjWb28HG3mlJPbiMRg8dDo4xBtZe7bQsb6VQLQY2o7s8rxW/DFKKBBSrP1HM8wKo2kI08MQSXp932WBTQLkQMnLoYZQSeu+8sxWevnLrQcNAcGtGrNhcIeg0AgEI52sPlvSVUm5GzJi8gAyMnQ8DfNOYc+lFtTkhETLVgRpKyz7kCbNNdjC0gNwoS9pJJb2Jwwi/QYVVh8A2vbrj6RYObAwDkqyTrg3zBis/kOAk91Khm2uSU5HQ/Sl1jTemPvtlimeuTXvU8SFbLqic3UDcLMHGT3KvzU9O/I33DIWZMeDQuRJb9KKnqN1tOCywlyv3nE/2a2yC5/H8C/gFMtFDLJX7xrg7UbtCkMkmIio4HZ3Fqr8WY4+miAfC06x2P78U/vTJjreuUnubISo1B/H5tU0CZOmBfhAlykzb2MhL8HHrw4BhkA+nKk00++cBEDttAvowJkUj8zBAhmdKyihoUGvRNygSZgAuCHaZziA2O/RB0jvIzSgnd7dmk5F7w5ZHvAgBLwLlwrShoQWPil1if0ALjuhxFe01DpcpBkSHAtmP2oLkFscEsL9jNFuQgjQcOO2tGdSHz9iVBzmvTIH+zu2tDigkqlsttedCC+EUu6wm7qmqTrqU7qnBx5hdxhg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(36840700001)(46966006)(4326008)(30864003)(82740400003)(8936002)(70586007)(2616005)(336012)(82310400003)(47076005)(5660300002)(70206006)(1076003)(478600001)(6666004)(316002)(26005)(426003)(81166007)(6636002)(7696005)(2906002)(8676002)(86362001)(356005)(110136005)(186003)(36860700001)(36756003)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 06:04:32.1666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c781e304-3d7b-49f8-b588-08d91442a54b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441
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
Cc: Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It is possible that the previous waves have exited before others are
created, so the other waves maybe reuse pyhsical resouces left by
previous ones. Therefore add barrier instruction to synchronize waves within
the same threadgroup.

Signed-off-by: Dennis Li <Dennis.Li@amd.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
index fdd65589f06b..dbad9ef002d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
@@ -93,98 +93,99 @@ static const struct soc15_reg_golden golden_settings_gc_9_4_2_alde[] = {
 static const u32 vgpr_init_compute_shader_aldebaran[] = {
 	0xb8840904, 0xb8851a04, 0xb8861344, 0xb8831804, 0x9208ff06, 0x00000280,
 	0x9209a805, 0x920a8a04, 0x81080908, 0x81080a08, 0x81080308, 0x8e078208,
-	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xd3d94000, 0x18000080,
-	0xd3d94001, 0x18000080, 0xd3d94002, 0x18000080, 0xd3d94003, 0x18000080,
-	0xd3d94004, 0x18000080, 0xd3d94005, 0x18000080, 0xd3d94006, 0x18000080,
-	0xd3d94007, 0x18000080, 0xd3d94008, 0x18000080, 0xd3d94009, 0x18000080,
-	0xd3d9400a, 0x18000080, 0xd3d9400b, 0x18000080, 0xd3d9400c, 0x18000080,
-	0xd3d9400d, 0x18000080, 0xd3d9400e, 0x18000080, 0xd3d9400f, 0x18000080,
-	0xd3d94010, 0x18000080, 0xd3d94011, 0x18000080, 0xd3d94012, 0x18000080,
-	0xd3d94013, 0x18000080, 0xd3d94014, 0x18000080, 0xd3d94015, 0x18000080,
-	0xd3d94016, 0x18000080, 0xd3d94017, 0x18000080, 0xd3d94018, 0x18000080,
-	0xd3d94019, 0x18000080, 0xd3d9401a, 0x18000080, 0xd3d9401b, 0x18000080,
-	0xd3d9401c, 0x18000080, 0xd3d9401d, 0x18000080, 0xd3d9401e, 0x18000080,
-	0xd3d9401f, 0x18000080, 0xd3d94020, 0x18000080, 0xd3d94021, 0x18000080,
-	0xd3d94022, 0x18000080, 0xd3d94023, 0x18000080, 0xd3d94024, 0x18000080,
-	0xd3d94025, 0x18000080, 0xd3d94026, 0x18000080, 0xd3d94027, 0x18000080,
-	0xd3d94028, 0x18000080, 0xd3d94029, 0x18000080, 0xd3d9402a, 0x18000080,
-	0xd3d9402b, 0x18000080, 0xd3d9402c, 0x18000080, 0xd3d9402d, 0x18000080,
-	0xd3d9402e, 0x18000080, 0xd3d9402f, 0x18000080, 0xd3d94030, 0x18000080,
-	0xd3d94031, 0x18000080, 0xd3d94032, 0x18000080, 0xd3d94033, 0x18000080,
-	0xd3d94034, 0x18000080, 0xd3d94035, 0x18000080, 0xd3d94036, 0x18000080,
-	0xd3d94037, 0x18000080, 0xd3d94038, 0x18000080, 0xd3d94039, 0x18000080,
-	0xd3d9403a, 0x18000080, 0xd3d9403b, 0x18000080, 0xd3d9403c, 0x18000080,
-	0xd3d9403d, 0x18000080, 0xd3d9403e, 0x18000080, 0xd3d9403f, 0x18000080,
-	0xd3d94040, 0x18000080, 0xd3d94041, 0x18000080, 0xd3d94042, 0x18000080,
-	0xd3d94043, 0x18000080, 0xd3d94044, 0x18000080, 0xd3d94045, 0x18000080,
-	0xd3d94046, 0x18000080, 0xd3d94047, 0x18000080, 0xd3d94048, 0x18000080,
-	0xd3d94049, 0x18000080, 0xd3d9404a, 0x18000080, 0xd3d9404b, 0x18000080,
-	0xd3d9404c, 0x18000080, 0xd3d9404d, 0x18000080, 0xd3d9404e, 0x18000080,
-	0xd3d9404f, 0x18000080, 0xd3d94050, 0x18000080, 0xd3d94051, 0x18000080,
-	0xd3d94052, 0x18000080, 0xd3d94053, 0x18000080, 0xd3d94054, 0x18000080,
-	0xd3d94055, 0x18000080, 0xd3d94056, 0x18000080, 0xd3d94057, 0x18000080,
-	0xd3d94058, 0x18000080, 0xd3d94059, 0x18000080, 0xd3d9405a, 0x18000080,
-	0xd3d9405b, 0x18000080, 0xd3d9405c, 0x18000080, 0xd3d9405d, 0x18000080,
-	0xd3d9405e, 0x18000080, 0xd3d9405f, 0x18000080, 0xd3d94060, 0x18000080,
-	0xd3d94061, 0x18000080, 0xd3d94062, 0x18000080, 0xd3d94063, 0x18000080,
-	0xd3d94064, 0x18000080, 0xd3d94065, 0x18000080, 0xd3d94066, 0x18000080,
-	0xd3d94067, 0x18000080, 0xd3d94068, 0x18000080, 0xd3d94069, 0x18000080,
-	0xd3d9406a, 0x18000080, 0xd3d9406b, 0x18000080, 0xd3d9406c, 0x18000080,
-	0xd3d9406d, 0x18000080, 0xd3d9406e, 0x18000080, 0xd3d9406f, 0x18000080,
-	0xd3d94070, 0x18000080, 0xd3d94071, 0x18000080, 0xd3d94072, 0x18000080,
-	0xd3d94073, 0x18000080, 0xd3d94074, 0x18000080, 0xd3d94075, 0x18000080,
-	0xd3d94076, 0x18000080, 0xd3d94077, 0x18000080, 0xd3d94078, 0x18000080,
-	0xd3d94079, 0x18000080, 0xd3d9407a, 0x18000080, 0xd3d9407b, 0x18000080,
-	0xd3d9407c, 0x18000080, 0xd3d9407d, 0x18000080, 0xd3d9407e, 0x18000080,
-	0xd3d9407f, 0x18000080, 0xd3d94080, 0x18000080, 0xd3d94081, 0x18000080,
-	0xd3d94082, 0x18000080, 0xd3d94083, 0x18000080, 0xd3d94084, 0x18000080,
-	0xd3d94085, 0x18000080, 0xd3d94086, 0x18000080, 0xd3d94087, 0x18000080,
-	0xd3d94088, 0x18000080, 0xd3d94089, 0x18000080, 0xd3d9408a, 0x18000080,
-	0xd3d9408b, 0x18000080, 0xd3d9408c, 0x18000080, 0xd3d9408d, 0x18000080,
-	0xd3d9408e, 0x18000080, 0xd3d9408f, 0x18000080, 0xd3d94090, 0x18000080,
-	0xd3d94091, 0x18000080, 0xd3d94092, 0x18000080, 0xd3d94093, 0x18000080,
-	0xd3d94094, 0x18000080, 0xd3d94095, 0x18000080, 0xd3d94096, 0x18000080,
-	0xd3d94097, 0x18000080, 0xd3d94098, 0x18000080, 0xd3d94099, 0x18000080,
-	0xd3d9409a, 0x18000080, 0xd3d9409b, 0x18000080, 0xd3d9409c, 0x18000080,
-	0xd3d9409d, 0x18000080, 0xd3d9409e, 0x18000080, 0xd3d9409f, 0x18000080,
-	0xd3d940a0, 0x18000080, 0xd3d940a1, 0x18000080, 0xd3d940a2, 0x18000080,
-	0xd3d940a3, 0x18000080, 0xd3d940a4, 0x18000080, 0xd3d940a5, 0x18000080,
-	0xd3d940a6, 0x18000080, 0xd3d940a7, 0x18000080, 0xd3d940a8, 0x18000080,
-	0xd3d940a9, 0x18000080, 0xd3d940aa, 0x18000080, 0xd3d940ab, 0x18000080,
-	0xd3d940ac, 0x18000080, 0xd3d940ad, 0x18000080, 0xd3d940ae, 0x18000080,
-	0xd3d940af, 0x18000080, 0xd3d940b0, 0x18000080, 0xd3d940b1, 0x18000080,
-	0xd3d940b2, 0x18000080, 0xd3d940b3, 0x18000080, 0xd3d940b4, 0x18000080,
-	0xd3d940b5, 0x18000080, 0xd3d940b6, 0x18000080, 0xd3d940b7, 0x18000080,
-	0xd3d940b8, 0x18000080, 0xd3d940b9, 0x18000080, 0xd3d940ba, 0x18000080,
-	0xd3d940bb, 0x18000080, 0xd3d940bc, 0x18000080, 0xd3d940bd, 0x18000080,
-	0xd3d940be, 0x18000080, 0xd3d940bf, 0x18000080, 0xd3d940c0, 0x18000080,
-	0xd3d940c1, 0x18000080, 0xd3d940c2, 0x18000080, 0xd3d940c3, 0x18000080,
-	0xd3d940c4, 0x18000080, 0xd3d940c5, 0x18000080, 0xd3d940c6, 0x18000080,
-	0xd3d940c7, 0x18000080, 0xd3d940c8, 0x18000080, 0xd3d940c9, 0x18000080,
-	0xd3d940ca, 0x18000080, 0xd3d940cb, 0x18000080, 0xd3d940cc, 0x18000080,
-	0xd3d940cd, 0x18000080, 0xd3d940ce, 0x18000080, 0xd3d940cf, 0x18000080,
-	0xd3d940d0, 0x18000080, 0xd3d940d1, 0x18000080, 0xd3d940d2, 0x18000080,
-	0xd3d940d3, 0x18000080, 0xd3d940d4, 0x18000080, 0xd3d940d5, 0x18000080,
-	0xd3d940d6, 0x18000080, 0xd3d940d7, 0x18000080, 0xd3d940d8, 0x18000080,
-	0xd3d940d9, 0x18000080, 0xd3d940da, 0x18000080, 0xd3d940db, 0x18000080,
-	0xd3d940dc, 0x18000080, 0xd3d940dd, 0x18000080, 0xd3d940de, 0x18000080,
-	0xd3d940df, 0x18000080, 0xd3d940e0, 0x18000080, 0xd3d940e1, 0x18000080,
-	0xd3d940e2, 0x18000080, 0xd3d940e3, 0x18000080, 0xd3d940e4, 0x18000080,
-	0xd3d940e5, 0x18000080, 0xd3d940e6, 0x18000080, 0xd3d940e7, 0x18000080,
-	0xd3d940e8, 0x18000080, 0xd3d940e9, 0x18000080, 0xd3d940ea, 0x18000080,
-	0xd3d940eb, 0x18000080, 0xd3d940ec, 0x18000080, 0xd3d940ed, 0x18000080,
-	0xd3d940ee, 0x18000080, 0xd3d940ef, 0x18000080, 0xd3d940f0, 0x18000080,
-	0xd3d940f1, 0x18000080, 0xd3d940f2, 0x18000080, 0xd3d940f3, 0x18000080,
-	0xd3d940f4, 0x18000080, 0xd3d940f5, 0x18000080, 0xd3d940f6, 0x18000080,
-	0xd3d940f7, 0x18000080, 0xd3d940f8, 0x18000080, 0xd3d940f9, 0x18000080,
-	0xd3d940fa, 0x18000080, 0xd3d940fb, 0x18000080, 0xd3d940fc, 0x18000080,
-	0xd3d940fd, 0x18000080, 0xd3d940fe, 0x18000080, 0xd3d940ff, 0x18000080,
-	0xb07c0000, 0xbe8a00ff, 0x000000f8, 0xbf11080a, 0x7e000280, 0x7e020280,
-	0x7e040280, 0x7e060280, 0x7e080280, 0x7e0a0280, 0x7e0c0280, 0x7e0e0280,
-	0x808a880a, 0xbe80320a, 0xbf84fff5, 0xbf9c0000, 0xd28c0001, 0x0001007f,
-	0xd28d0001, 0x0002027e, 0x10020288, 0xbe8b0004, 0xb78b4000, 0xd1196a01,
-	0x00001701, 0xbe8a0087, 0xbefc00c1, 0xd89c4000, 0x00020201, 0xd89cc080,
-	0x00040401, 0x320202ff, 0x00000800, 0x808a810a, 0xbf84fff8, 0xbf810000,
+	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8a0000, 0xd3d94000,
+	0x18000080, 0xd3d94001, 0x18000080, 0xd3d94002, 0x18000080, 0xd3d94003,
+	0x18000080, 0xd3d94004, 0x18000080, 0xd3d94005, 0x18000080, 0xd3d94006,
+	0x18000080, 0xd3d94007, 0x18000080, 0xd3d94008, 0x18000080, 0xd3d94009,
+	0x18000080, 0xd3d9400a, 0x18000080, 0xd3d9400b, 0x18000080, 0xd3d9400c,
+	0x18000080, 0xd3d9400d, 0x18000080, 0xd3d9400e, 0x18000080, 0xd3d9400f,
+	0x18000080, 0xd3d94010, 0x18000080, 0xd3d94011, 0x18000080, 0xd3d94012,
+	0x18000080, 0xd3d94013, 0x18000080, 0xd3d94014, 0x18000080, 0xd3d94015,
+	0x18000080, 0xd3d94016, 0x18000080, 0xd3d94017, 0x18000080, 0xd3d94018,
+	0x18000080, 0xd3d94019, 0x18000080, 0xd3d9401a, 0x18000080, 0xd3d9401b,
+	0x18000080, 0xd3d9401c, 0x18000080, 0xd3d9401d, 0x18000080, 0xd3d9401e,
+	0x18000080, 0xd3d9401f, 0x18000080, 0xd3d94020, 0x18000080, 0xd3d94021,
+	0x18000080, 0xd3d94022, 0x18000080, 0xd3d94023, 0x18000080, 0xd3d94024,
+	0x18000080, 0xd3d94025, 0x18000080, 0xd3d94026, 0x18000080, 0xd3d94027,
+	0x18000080, 0xd3d94028, 0x18000080, 0xd3d94029, 0x18000080, 0xd3d9402a,
+	0x18000080, 0xd3d9402b, 0x18000080, 0xd3d9402c, 0x18000080, 0xd3d9402d,
+	0x18000080, 0xd3d9402e, 0x18000080, 0xd3d9402f, 0x18000080, 0xd3d94030,
+	0x18000080, 0xd3d94031, 0x18000080, 0xd3d94032, 0x18000080, 0xd3d94033,
+	0x18000080, 0xd3d94034, 0x18000080, 0xd3d94035, 0x18000080, 0xd3d94036,
+	0x18000080, 0xd3d94037, 0x18000080, 0xd3d94038, 0x18000080, 0xd3d94039,
+	0x18000080, 0xd3d9403a, 0x18000080, 0xd3d9403b, 0x18000080, 0xd3d9403c,
+	0x18000080, 0xd3d9403d, 0x18000080, 0xd3d9403e, 0x18000080, 0xd3d9403f,
+	0x18000080, 0xd3d94040, 0x18000080, 0xd3d94041, 0x18000080, 0xd3d94042,
+	0x18000080, 0xd3d94043, 0x18000080, 0xd3d94044, 0x18000080, 0xd3d94045,
+	0x18000080, 0xd3d94046, 0x18000080, 0xd3d94047, 0x18000080, 0xd3d94048,
+	0x18000080, 0xd3d94049, 0x18000080, 0xd3d9404a, 0x18000080, 0xd3d9404b,
+	0x18000080, 0xd3d9404c, 0x18000080, 0xd3d9404d, 0x18000080, 0xd3d9404e,
+	0x18000080, 0xd3d9404f, 0x18000080, 0xd3d94050, 0x18000080, 0xd3d94051,
+	0x18000080, 0xd3d94052, 0x18000080, 0xd3d94053, 0x18000080, 0xd3d94054,
+	0x18000080, 0xd3d94055, 0x18000080, 0xd3d94056, 0x18000080, 0xd3d94057,
+	0x18000080, 0xd3d94058, 0x18000080, 0xd3d94059, 0x18000080, 0xd3d9405a,
+	0x18000080, 0xd3d9405b, 0x18000080, 0xd3d9405c, 0x18000080, 0xd3d9405d,
+	0x18000080, 0xd3d9405e, 0x18000080, 0xd3d9405f, 0x18000080, 0xd3d94060,
+	0x18000080, 0xd3d94061, 0x18000080, 0xd3d94062, 0x18000080, 0xd3d94063,
+	0x18000080, 0xd3d94064, 0x18000080, 0xd3d94065, 0x18000080, 0xd3d94066,
+	0x18000080, 0xd3d94067, 0x18000080, 0xd3d94068, 0x18000080, 0xd3d94069,
+	0x18000080, 0xd3d9406a, 0x18000080, 0xd3d9406b, 0x18000080, 0xd3d9406c,
+	0x18000080, 0xd3d9406d, 0x18000080, 0xd3d9406e, 0x18000080, 0xd3d9406f,
+	0x18000080, 0xd3d94070, 0x18000080, 0xd3d94071, 0x18000080, 0xd3d94072,
+	0x18000080, 0xd3d94073, 0x18000080, 0xd3d94074, 0x18000080, 0xd3d94075,
+	0x18000080, 0xd3d94076, 0x18000080, 0xd3d94077, 0x18000080, 0xd3d94078,
+	0x18000080, 0xd3d94079, 0x18000080, 0xd3d9407a, 0x18000080, 0xd3d9407b,
+	0x18000080, 0xd3d9407c, 0x18000080, 0xd3d9407d, 0x18000080, 0xd3d9407e,
+	0x18000080, 0xd3d9407f, 0x18000080, 0xd3d94080, 0x18000080, 0xd3d94081,
+	0x18000080, 0xd3d94082, 0x18000080, 0xd3d94083, 0x18000080, 0xd3d94084,
+	0x18000080, 0xd3d94085, 0x18000080, 0xd3d94086, 0x18000080, 0xd3d94087,
+	0x18000080, 0xd3d94088, 0x18000080, 0xd3d94089, 0x18000080, 0xd3d9408a,
+	0x18000080, 0xd3d9408b, 0x18000080, 0xd3d9408c, 0x18000080, 0xd3d9408d,
+	0x18000080, 0xd3d9408e, 0x18000080, 0xd3d9408f, 0x18000080, 0xd3d94090,
+	0x18000080, 0xd3d94091, 0x18000080, 0xd3d94092, 0x18000080, 0xd3d94093,
+	0x18000080, 0xd3d94094, 0x18000080, 0xd3d94095, 0x18000080, 0xd3d94096,
+	0x18000080, 0xd3d94097, 0x18000080, 0xd3d94098, 0x18000080, 0xd3d94099,
+	0x18000080, 0xd3d9409a, 0x18000080, 0xd3d9409b, 0x18000080, 0xd3d9409c,
+	0x18000080, 0xd3d9409d, 0x18000080, 0xd3d9409e, 0x18000080, 0xd3d9409f,
+	0x18000080, 0xd3d940a0, 0x18000080, 0xd3d940a1, 0x18000080, 0xd3d940a2,
+	0x18000080, 0xd3d940a3, 0x18000080, 0xd3d940a4, 0x18000080, 0xd3d940a5,
+	0x18000080, 0xd3d940a6, 0x18000080, 0xd3d940a7, 0x18000080, 0xd3d940a8,
+	0x18000080, 0xd3d940a9, 0x18000080, 0xd3d940aa, 0x18000080, 0xd3d940ab,
+	0x18000080, 0xd3d940ac, 0x18000080, 0xd3d940ad, 0x18000080, 0xd3d940ae,
+	0x18000080, 0xd3d940af, 0x18000080, 0xd3d940b0, 0x18000080, 0xd3d940b1,
+	0x18000080, 0xd3d940b2, 0x18000080, 0xd3d940b3, 0x18000080, 0xd3d940b4,
+	0x18000080, 0xd3d940b5, 0x18000080, 0xd3d940b6, 0x18000080, 0xd3d940b7,
+	0x18000080, 0xd3d940b8, 0x18000080, 0xd3d940b9, 0x18000080, 0xd3d940ba,
+	0x18000080, 0xd3d940bb, 0x18000080, 0xd3d940bc, 0x18000080, 0xd3d940bd,
+	0x18000080, 0xd3d940be, 0x18000080, 0xd3d940bf, 0x18000080, 0xd3d940c0,
+	0x18000080, 0xd3d940c1, 0x18000080, 0xd3d940c2, 0x18000080, 0xd3d940c3,
+	0x18000080, 0xd3d940c4, 0x18000080, 0xd3d940c5, 0x18000080, 0xd3d940c6,
+	0x18000080, 0xd3d940c7, 0x18000080, 0xd3d940c8, 0x18000080, 0xd3d940c9,
+	0x18000080, 0xd3d940ca, 0x18000080, 0xd3d940cb, 0x18000080, 0xd3d940cc,
+	0x18000080, 0xd3d940cd, 0x18000080, 0xd3d940ce, 0x18000080, 0xd3d940cf,
+	0x18000080, 0xd3d940d0, 0x18000080, 0xd3d940d1, 0x18000080, 0xd3d940d2,
+	0x18000080, 0xd3d940d3, 0x18000080, 0xd3d940d4, 0x18000080, 0xd3d940d5,
+	0x18000080, 0xd3d940d6, 0x18000080, 0xd3d940d7, 0x18000080, 0xd3d940d8,
+	0x18000080, 0xd3d940d9, 0x18000080, 0xd3d940da, 0x18000080, 0xd3d940db,
+	0x18000080, 0xd3d940dc, 0x18000080, 0xd3d940dd, 0x18000080, 0xd3d940de,
+	0x18000080, 0xd3d940df, 0x18000080, 0xd3d940e0, 0x18000080, 0xd3d940e1,
+	0x18000080, 0xd3d940e2, 0x18000080, 0xd3d940e3, 0x18000080, 0xd3d940e4,
+	0x18000080, 0xd3d940e5, 0x18000080, 0xd3d940e6, 0x18000080, 0xd3d940e7,
+	0x18000080, 0xd3d940e8, 0x18000080, 0xd3d940e9, 0x18000080, 0xd3d940ea,
+	0x18000080, 0xd3d940eb, 0x18000080, 0xd3d940ec, 0x18000080, 0xd3d940ed,
+	0x18000080, 0xd3d940ee, 0x18000080, 0xd3d940ef, 0x18000080, 0xd3d940f0,
+	0x18000080, 0xd3d940f1, 0x18000080, 0xd3d940f2, 0x18000080, 0xd3d940f3,
+	0x18000080, 0xd3d940f4, 0x18000080, 0xd3d940f5, 0x18000080, 0xd3d940f6,
+	0x18000080, 0xd3d940f7, 0x18000080, 0xd3d940f8, 0x18000080, 0xd3d940f9,
+	0x18000080, 0xd3d940fa, 0x18000080, 0xd3d940fb, 0x18000080, 0xd3d940fc,
+	0x18000080, 0xd3d940fd, 0x18000080, 0xd3d940fe, 0x18000080, 0xd3d940ff,
+	0x18000080, 0xb07c0000, 0xbe8a00ff, 0x000000f8, 0xbf11080a, 0x7e000280,
+	0x7e020280, 0x7e040280, 0x7e060280, 0x7e080280, 0x7e0a0280, 0x7e0c0280,
+	0x7e0e0280, 0x808a880a, 0xbe80320a, 0xbf84fff5, 0xbf9c0000, 0xd28c0001,
+	0x0001007f, 0xd28d0001, 0x0002027e, 0x10020288, 0xbe8b0004, 0xb78b4000,
+	0xd1196a01, 0x00001701, 0xbe8a0087, 0xbefc00c1, 0xd89c4000, 0x00020201,
+	0xd89cc080, 0x00040401, 0x320202ff, 0x00000800, 0x808a810a, 0xbf84fff8,
+	0xbf810000,
 };
 
 const struct soc15_reg_entry vgpr_init_regs_aldebaran[] = {
@@ -220,24 +221,25 @@ static const u32 sgpr112_init_compute_shader_aldebaran[] = {
 	0x9209a805, 0x920a8a04, 0x81080908, 0x81080a08, 0x81080308, 0x8e078208,
 	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8e003f, 0xc0030200,
 	0x00000000, 0xbf8c0000, 0xbf06ff08, 0xdeadbeaf, 0xbf84fff9, 0x81028102,
-	0xc0410080, 0x00000007, 0xbf8c0000, 0xbefc0080, 0xbeea0080, 0xbeeb0080,
-	0xbf00f280, 0xbee60080, 0xbee70080, 0xbee80080, 0xbee90080, 0xbefe0080,
-	0xbeff0080, 0xbe880080, 0xbe890080, 0xbe8a0080, 0xbe8b0080, 0xbe8c0080,
-	0xbe8d0080, 0xbe8e0080, 0xbe8f0080, 0xbe900080, 0xbe910080, 0xbe920080,
-	0xbe930080, 0xbe940080, 0xbe950080, 0xbe960080, 0xbe970080, 0xbe980080,
-	0xbe990080, 0xbe9a0080, 0xbe9b0080, 0xbe9c0080, 0xbe9d0080, 0xbe9e0080,
-	0xbe9f0080, 0xbea00080, 0xbea10080, 0xbea20080, 0xbea30080, 0xbea40080,
-	0xbea50080, 0xbea60080, 0xbea70080, 0xbea80080, 0xbea90080, 0xbeaa0080,
-	0xbeab0080, 0xbeac0080, 0xbead0080, 0xbeae0080, 0xbeaf0080, 0xbeb00080,
-	0xbeb10080, 0xbeb20080, 0xbeb30080, 0xbeb40080, 0xbeb50080, 0xbeb60080,
-	0xbeb70080, 0xbeb80080, 0xbeb90080, 0xbeba0080, 0xbebb0080, 0xbebc0080,
-	0xbebd0080, 0xbebe0080, 0xbebf0080, 0xbec00080, 0xbec10080, 0xbec20080,
-	0xbec30080, 0xbec40080, 0xbec50080, 0xbec60080, 0xbec70080, 0xbec80080,
-	0xbec90080, 0xbeca0080, 0xbecb0080, 0xbecc0080, 0xbecd0080, 0xbece0080,
-	0xbecf0080, 0xbed00080, 0xbed10080, 0xbed20080, 0xbed30080, 0xbed40080,
-	0xbed50080, 0xbed60080, 0xbed70080, 0xbed80080, 0xbed90080, 0xbeda0080,
-	0xbedb0080, 0xbedc0080, 0xbedd0080, 0xbede0080, 0xbedf0080, 0xbee00080,
-	0xbee10080, 0xbee20080, 0xbee30080, 0xbee40080, 0xbee50080, 0xbf810000,
+	0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8a0000, 0xbefc0080, 0xbeea0080,
+	0xbeeb0080, 0xbf00f280, 0xbee60080, 0xbee70080, 0xbee80080, 0xbee90080,
+	0xbefe0080, 0xbeff0080, 0xbe880080, 0xbe890080, 0xbe8a0080, 0xbe8b0080,
+	0xbe8c0080, 0xbe8d0080, 0xbe8e0080, 0xbe8f0080, 0xbe900080, 0xbe910080,
+	0xbe920080, 0xbe930080, 0xbe940080, 0xbe950080, 0xbe960080, 0xbe970080,
+	0xbe980080, 0xbe990080, 0xbe9a0080, 0xbe9b0080, 0xbe9c0080, 0xbe9d0080,
+	0xbe9e0080, 0xbe9f0080, 0xbea00080, 0xbea10080, 0xbea20080, 0xbea30080,
+	0xbea40080, 0xbea50080, 0xbea60080, 0xbea70080, 0xbea80080, 0xbea90080,
+	0xbeaa0080, 0xbeab0080, 0xbeac0080, 0xbead0080, 0xbeae0080, 0xbeaf0080,
+	0xbeb00080, 0xbeb10080, 0xbeb20080, 0xbeb30080, 0xbeb40080, 0xbeb50080,
+	0xbeb60080, 0xbeb70080, 0xbeb80080, 0xbeb90080, 0xbeba0080, 0xbebb0080,
+	0xbebc0080, 0xbebd0080, 0xbebe0080, 0xbebf0080, 0xbec00080, 0xbec10080,
+	0xbec20080, 0xbec30080, 0xbec40080, 0xbec50080, 0xbec60080, 0xbec70080,
+	0xbec80080, 0xbec90080, 0xbeca0080, 0xbecb0080, 0xbecc0080, 0xbecd0080,
+	0xbece0080, 0xbecf0080, 0xbed00080, 0xbed10080, 0xbed20080, 0xbed30080,
+	0xbed40080, 0xbed50080, 0xbed60080, 0xbed70080, 0xbed80080, 0xbed90080,
+	0xbeda0080, 0xbedb0080, 0xbedc0080, 0xbedd0080, 0xbede0080, 0xbedf0080,
+	0xbee00080, 0xbee10080, 0xbee20080, 0xbee30080, 0xbee40080, 0xbee50080,
+	0xbf810000
 };
 
 const struct soc15_reg_entry sgpr112_init_regs_aldebaran[] = {
@@ -263,22 +265,23 @@ static const u32 sgpr96_init_compute_shader_aldebaran[] = {
 	0x9209a805, 0x920a8a04, 0x81080908, 0x81080a08, 0x81080308, 0x8e078208,
 	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8e003f, 0xc0030200,
 	0x00000000, 0xbf8c0000, 0xbf06ff08, 0xdeadbeaf, 0xbf84fff9, 0x81028102,
-	0xc0410080, 0x00000007, 0xbf8c0000, 0xbefc0080, 0xbeea0080, 0xbeeb0080,
-	0xbf00f280, 0xbee60080, 0xbee70080, 0xbee80080, 0xbee90080, 0xbefe0080,
-	0xbeff0080, 0xbe880080, 0xbe890080, 0xbe8a0080, 0xbe8b0080, 0xbe8c0080,
-	0xbe8d0080, 0xbe8e0080, 0xbe8f0080, 0xbe900080, 0xbe910080, 0xbe920080,
-	0xbe930080, 0xbe940080, 0xbe950080, 0xbe960080, 0xbe970080, 0xbe980080,
-	0xbe990080, 0xbe9a0080, 0xbe9b0080, 0xbe9c0080, 0xbe9d0080, 0xbe9e0080,
-	0xbe9f0080, 0xbea00080, 0xbea10080, 0xbea20080, 0xbea30080, 0xbea40080,
-	0xbea50080, 0xbea60080, 0xbea70080, 0xbea80080, 0xbea90080, 0xbeaa0080,
-	0xbeab0080, 0xbeac0080, 0xbead0080, 0xbeae0080, 0xbeaf0080, 0xbeb00080,
-	0xbeb10080, 0xbeb20080, 0xbeb30080, 0xbeb40080, 0xbeb50080, 0xbeb60080,
-	0xbeb70080, 0xbeb80080, 0xbeb90080, 0xbeba0080, 0xbebb0080, 0xbebc0080,
-	0xbebd0080, 0xbebe0080, 0xbebf0080, 0xbec00080, 0xbec10080, 0xbec20080,
-	0xbec30080, 0xbec40080, 0xbec50080, 0xbec60080, 0xbec70080, 0xbec80080,
-	0xbec90080, 0xbeca0080, 0xbecb0080, 0xbecc0080, 0xbecd0080, 0xbece0080,
-	0xbecf0080, 0xbed00080, 0xbed10080, 0xbed20080, 0xbed30080, 0xbed40080,
-	0xbed50080, 0xbed60080, 0xbed70080, 0xbed80080, 0xbed90080, 0xbf810000,
+	0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8a0000, 0xbefc0080, 0xbeea0080,
+	0xbeeb0080, 0xbf00f280, 0xbee60080, 0xbee70080, 0xbee80080, 0xbee90080,
+	0xbefe0080, 0xbeff0080, 0xbe880080, 0xbe890080, 0xbe8a0080, 0xbe8b0080,
+	0xbe8c0080, 0xbe8d0080, 0xbe8e0080, 0xbe8f0080, 0xbe900080, 0xbe910080,
+	0xbe920080, 0xbe930080, 0xbe940080, 0xbe950080, 0xbe960080, 0xbe970080,
+	0xbe980080, 0xbe990080, 0xbe9a0080, 0xbe9b0080, 0xbe9c0080, 0xbe9d0080,
+	0xbe9e0080, 0xbe9f0080, 0xbea00080, 0xbea10080, 0xbea20080, 0xbea30080,
+	0xbea40080, 0xbea50080, 0xbea60080, 0xbea70080, 0xbea80080, 0xbea90080,
+	0xbeaa0080, 0xbeab0080, 0xbeac0080, 0xbead0080, 0xbeae0080, 0xbeaf0080,
+	0xbeb00080, 0xbeb10080, 0xbeb20080, 0xbeb30080, 0xbeb40080, 0xbeb50080,
+	0xbeb60080, 0xbeb70080, 0xbeb80080, 0xbeb90080, 0xbeba0080, 0xbebb0080,
+	0xbebc0080, 0xbebd0080, 0xbebe0080, 0xbebf0080, 0xbec00080, 0xbec10080,
+	0xbec20080, 0xbec30080, 0xbec40080, 0xbec50080, 0xbec60080, 0xbec70080,
+	0xbec80080, 0xbec90080, 0xbeca0080, 0xbecb0080, 0xbecc0080, 0xbecd0080,
+	0xbece0080, 0xbecf0080, 0xbed00080, 0xbed10080, 0xbed20080, 0xbed30080,
+	0xbed40080, 0xbed50080, 0xbed60080, 0xbed70080, 0xbed80080, 0xbed90080,
+	0xbf810000,
 };
 
 const struct soc15_reg_entry sgpr96_init_regs_aldebaran[] = {
@@ -307,7 +310,9 @@ const struct soc15_reg_entry sgpr96_init_regs_aldebaran[] = {
 static const u32 sgpr64_init_compute_shader_aldebaran[] = {
 	0xb8840904, 0xb8851a04, 0xb8861344, 0xb8831804, 0x9208ff06, 0x00000280,
 	0x9209a805, 0x920a8a04, 0x81080908, 0x81080a08, 0x81080308, 0x8e078208,
-	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xbefc0080, 0xbeea0080,
+	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8e003f, 0xc0030200,
+	0x00000000, 0xbf8c0000, 0xbf06ff08, 0xdeadbeaf, 0xbf84fff9, 0x81028102,
+	0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8a0000, 0xbefc0080, 0xbeea0080,
 	0xbeeb0080, 0xbf00f280, 0xbee60080, 0xbee70080, 0xbee80080, 0xbee90080,
 	0xbefe0080, 0xbeff0080, 0xbe880080, 0xbe890080, 0xbe8a0080, 0xbe8b0080,
 	0xbe8c0080, 0xbe8d0080, 0xbe8e0080, 0xbe8f0080, 0xbe900080, 0xbe910080,
@@ -586,19 +591,22 @@ static int gfx_v9_4_2_do_sgprs_init(struct amdgpu_device *adev)
 		goto disp1_failed;
 	}
 
-	r = dma_fence_wait(fences[2], false);
-	if (r) {
-		dev_err(adev->dev, "timeout to clear first 256 sgprs\n");
-		goto disp2_failed;
-	}
-
 	r = gfx_v9_4_2_wait_for_waves_assigned(adev,
 			&wb_ib.ptr[1], 0b1111,
 			pattern[2],
 			adev->gfx.cu_info.number * SIMD_ID_MAX * 4,
-			false);
+			true);
 	if (r) {
 		dev_err(adev->dev, "wave coverage failed when clear first 256 sgprs\n");
+		wb_ib.ptr[0] = 0xdeadbeaf; /* stop waves */
+		goto disp2_failed;
+	}
+
+	wb_ib.ptr[0] = 0xdeadbeaf; /* stop waves */
+
+	r = dma_fence_wait(fences[2], false);
+	if (r) {
+		dev_err(adev->dev, "timeout to clear first 256 sgprs\n");
 		goto disp2_failed;
 	}
 
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
