Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8829CE51
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Oct 2020 07:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F359E6E47B;
	Wed, 28 Oct 2020 06:06:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8D86E47B
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Oct 2020 06:06:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGMj05cOvdilRtuPtkuaiCEKjwfIscf+CNxpl6mu2bbZUAJ71UtPqcEzw8S0fevTQJiir3DIlNdHcUM6DoijI/EWnX9j7ifwYxeJYdHYnWwpkxf1iYFXr110m7E3gjQ0AeUajd4zktN9FHvLruUwlY5gO51Hhxj8QEApYv+wuZ3e9m2XcwzSVRK04pmsdWeV9AdEckqErQx4hXJqNDEx2zBETyXwxX00pPBJOocFujPLhEbAq7DGdvM33Pp39hrVK0zpE29J9ATnPpsQ7MtVnZI52TK+My6CdzZuPyFvhGaU+QANecWM/hIaWUfUWmrb5t7rEpv9evsfcD4MeExNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQFkKRVzaxlJZ9qMYvDCkxp/5VlNHRs8NRsJNFZI3qc=;
 b=CkUad7YUHXdIR79el0FdKuWtRHa30itsGwAxtyOhy43Uw36lQu/oI+jfx4wpqF46RuWPRZDfq0L7IYJpzuzG2RYCENn1MzWj3b/pKozuO615W1IfOagtJwh32LNErsbwJphuSq/Jg1aZ/+eW2DjibWG1yp1sa6E5JLQStOZO4Xt71fEM4FZnnboMc1nN8099RiNQ/9sIai9QX4MXw/dv/RDkHE7YaTk8Eg3c2JaR88yK6Z8i4HH9Ve44GNS+xNil0CgL/e60BqQEtREZNbDTArkUPMMxbJb3n62rzco56fjKYd2CgmyR2TS35tp9MggDP+M1guPxLV+yvN3RVyPHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQFkKRVzaxlJZ9qMYvDCkxp/5VlNHRs8NRsJNFZI3qc=;
 b=C8T5esEPPqBHtRsIP/GWVZ+t+AI+nPJFwIqQXpDp/p98o46ZEggzVphXSWG0uc7VduG3c8LgD6ny3NsmhACh5EILWLtwUP7FKHxfXzHdKVpYV+7A1CLybuSZsJmDay6TIbjVPTw96jdLTwdtBC07CRsjxTUrw0LysV3Zn+hhXyY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB3765.namprd12.prod.outlook.com (2603:10b6:610:25::18)
 by CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 06:06:54 +0000
Received: from CH2PR12MB3765.namprd12.prod.outlook.com
 ([fe80::300d:3bf6:2b71:b6af]) by CH2PR12MB3765.namprd12.prod.outlook.com
 ([fe80::300d:3bf6:2b71:b6af%7]) with mapi id 15.20.3499.018; Wed, 28 Oct 2020
 06:06:54 +0000
From: Flora Cui <flora.cui@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: disable DCN and VCN for Navi14 0x7340/C9 SKU
Date: Wed, 28 Oct 2020 14:06:37 +0800
Message-Id: <20201028060638.2339229-1-flora.cui@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [58.247.170.242]
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To CH2PR12MB3765.namprd12.prod.outlook.com
 (2603:10b6:610:25::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from flora.amd.com (58.247.170.242) by
 HKAPR04CA0011.apcprd04.prod.outlook.com (2603:1096:203:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 06:06:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9631c984-133f-4dc3-ec9d-08d87b07ab6a
X-MS-TrafficTypeDiagnostic: CH2PR12MB4133:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB4133B384CAAA478DD2558BFCFA170@CH2PR12MB4133.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TvxtZHUZDKXkgHES0OoMMLUz4Gy9SUcaf+KRtCQjjudWJkAxuvbeCS9OooROR7kF8bBdMw5jxpKPZVx/SIOnk7InUMpavMAcdN+HdtD1i8caszQkIbeKBU6pKZCh25GsQVGcEk2t+0gxT91Vm5SRoDB66wb/MBbyKnUxGMO2ElpQllBYJt3+YarDuMuxD6I4Tmg06r9d3jYI3uUH7dMR6rYCx+MtgZOLfveKyPJjNB8pG2LJ82iEzdTLQAlJnw0vObaiGye1XBFiUjRfzNGxQbqGZUhsFoGnaBpRiwXQRfv2U34zrUibu1+ME8CmTCAGMkYXjzpcqe4+GfX9U/fNwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3765.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(66946007)(54906003)(5660300002)(6486002)(16526019)(2906002)(8936002)(26005)(44832011)(7696005)(4326008)(186003)(316002)(8676002)(478600001)(956004)(86362001)(2616005)(52116002)(6916009)(36756003)(6666004)(66476007)(4744005)(66556008)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: clY4/43x6ocmON/Zb59V8Byu5a9IPVxdoTJdwAz/c8+J6aOh1+z/Yt3cZRvAGTaInuhNLPHi/GeV5idUQya3588sK/8wfPkTzPt2uQna77eK4uoaZEYSCFDHR07o5716GpTlMJNEEuetXqZi9lXiPDQJlcpwcWu3E+kRLybM+WT2ntDtXv+g4aSySCiaoumKm5lK+lt9gTk6pZjHK98JofQ9HbLCYmS5sjOJgk8IZGJ4nnChACnVuI0jsFJZXyclkq5MVKRnqF86Xu9Te9ORwvTfsG4tywgAYZW9rZ2vZBIPXBGYmbui3XQCNUxmA7dUsD7W6UvNl8oFg1eWcpb6396dcbrUKtBor+FPZNcvxfmT7Xby2UZCymS1yy/vtkZLaEQko/LkjaUHvxG8KBTEVf0+dkoWaJu1ckCSsk1JPZAjrkEll1S9WA2GoC5EexIv2VRMujWFGC/Tl+TEYvGs/4XDBdep+kLoOGnbhBBCgX16MYuQXEJQ1vh3OqTO454DdFUf6eJFXvXhWcKMR6T1f1Id1nis7IEPHv0WANCV3N2SQ9tudrkWlnjWTHNqQ6kmMydDMischRPNblU6PvVJi9ylTj9jR6OeL/hmdEeM+rhLeGFQcDB1/vj93HdsgZB7GJ3osJ1Pd1HPY0W+bjEhfw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9631c984-133f-4dc3-ec9d-08d87b07ab6a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3765.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 06:06:54.7441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 369fd6HOIGh5eFpPiFU0j+4Ceeyilo74/cLK4rHJEbrXFs7AZa9WtRNuUWK3ktC5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4133
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
Cc: Long Gang <Gang.Long@amd.com>, Chen Guchun <Guchun.Chen@amd.com>,
 Xu Feifei <Feifei.Xu@amd.com>, Yin Tianci <Tianci.Yin@amd.com>,
 Flora Cui <flora.cui@amd.com>, Teng Rui <Rui.Teng@amd.com>,
 Zhang Hawking <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Navi14 0x7340/C9 SKU has no display and video support, remove them.

Signed-off-by: Flora Cui <flora.cui@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index b7fc9ebdf1c1..23446aceea1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -495,8 +495,9 @@ void nv_set_virt_ops(struct amdgpu_device *adev)
 
 static bool nv_is_blockchain_sku(struct pci_dev *pdev)
 {
-	if (pdev->device == 0x731E &&
-	    (pdev->revision == 0xC6 || pdev->revision == 0xC7))
+	if ((pdev->device == 0x731E &&
+	    (pdev->revision == 0xC6 || pdev->revision == 0xC7)) ||
+	    (pdev->device == 0x7340 && pdev->revision == 0xC9))
 		return true;
 	return false;
 }
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
