Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB59A143C
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 10:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8D189225;
	Thu, 29 Aug 2019 08:59:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740042.outbound.protection.outlook.com [40.107.74.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ABA89225
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 08:59:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5Azn6ZgeoW2qmatuVy6aGeJPzWyurIIe1SRL4paQ2fB64nNf2IWPlhVxXAfo2LiISNvPT2AfDpDG2wbsGB03QLPSsLCq9YF1LPmi6jwDLsBlTWuKSq2PtYx/izQ0eCA+rzN/DMgKqg9iNYDK4Ba2oWABwxI5ES00DjHlq1z+r4YD7Z6PGKAbUIL6uLfnx9u0Y85I9ekyPvRg5rQCkB2JWiCLaXBBVLFSQi5qUU3N1IAMQMOBPHT30dDlGD+B6uJ5aYvUh78haYhYdJLpgbHqgob4er22rFc3Md00/WaVjIvrqdeIH1lRoO3k7zfmlq4nf1DzJXic9lyzuZFxfRinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wxhqs/+AC62J1bbQiPRLHSvckhX0wGuabMquSkNP7Tk=;
 b=j/2ZHkXNcg4IteHdfVw+vz+4Kk5y2rieH9UyflKqTwgsTNn6hZt6GAVd5SHjwsVxMVfeWAR/ZaqN3SX7xm/vAMVAVHzWkH7NlbL8ITmeVLfScakLKMB0M4OL7z3A+eNtC++9fbEYf9Z1zxqLjoU1STuFnWRldvxIR/NmD+BE83114QK9vIZt/NFMqbLXPrI+mvfTltMdlgPmk4CsWGajMmXaLQBObgzCxoX5BrNGkfCR7gwBJYkw66a0piDhDYP+l4BbC5qfX0bgmKDs7h/FjO2E/7Z69FWxNbnpqmV2GbumzdotGXE6ospexnVtCtOlr0vtHCQtd+qucvDOBtl0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0084.namprd12.prod.outlook.com (2603:10b6:802:21::19)
 by DM5PR12MB1532.namprd12.prod.outlook.com (2603:10b6:4:6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 29 Aug 2019 08:59:49 +0000
Received: from CO1NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by SN1PR12CA0084.outlook.office365.com
 (2603:10b6:802:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16 via Frontend
 Transport; Thu, 29 Aug 2019 08:59:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT032.mail.protection.outlook.com (10.152.80.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 08:59:48 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Thu, 29 Aug 2019 03:59:46 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <christian.koenig@amd.com>, <alexander.deucher@amd.com>, 
 <Tao.Zhou1@amd.com>
Subject: [PATCH libdrm 0/4] amdgpu: new approach for ras inject test
Date: Thu, 29 Aug 2019 16:59:13 +0800
Message-ID: <20190829085917.20439-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(478600001)(316002)(23676004)(336012)(186003)(2616005)(476003)(126002)(26005)(50226002)(53416004)(50466002)(54906003)(110136005)(70586007)(5660300002)(8676002)(70206006)(47776003)(1076003)(81166006)(305945005)(4744005)(8936002)(4326008)(81156014)(14444005)(53936002)(356004)(36756003)(5820100001)(2870700001)(6666004)(486006)(2201001)(7696005)(426003)(2906002)(44832011)(6636002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1532; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d9ec766-dfcb-4ecb-6270-08d72c5f3f65
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1532; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1532:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1532D2674215B2282AC295AFF1A20@DM5PR12MB1532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: r+ccWMj1ijuiTVraYiHJg+ZOjO3a7gxKCkhVrzFP0S5cz8liGmHonw2JyUmvsP7iHZpvLfFZfNGsJeDtnhaCHGcAG+NfRvT/2OEh89Co6DAXmCbV33APn+cZzZfItcqxbo4S4oSP1kSdDyYFymuoLNwiMTEZPBjFtFmquhCMUmXeZW0eVcPvJ8iIHXm24VlVXINWI0z3G7u7NRgdXI9R7xnXTSQTRsXd/8q1ALAAkzLZC91VrlmHmeV0yiGQm1yppxg2CBI/1OnjiGIsXX1AlkhuiCvqbaGTf/NWPLH0gZWMAtRwV5RvWAD/sH+ikFpowFPIerDV8hFYuNDtd6acIOYR6OhbQuPD539Hj4rzmbli1QRh1GSSdQyYMNu2xai2LVohW80aS40o2sk5xpnDZ5v7aca4NypVk8cR7ulzIoM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 08:59:48.9639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9ec766-dfcb-4ecb-6270-08d72c5f3f65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wxhqs/+AC62J1bbQiPRLHSvckhX0wGuabMquSkNP7Tk=;
 b=LBQXpb6bYfKkfllj2IKMi9e8N8k3ymJmU7pmfa2iRBEDELsCpdpjq9nmKJUxInDGXzffNUFVR/UEFw390MQpd1uybB6cQ5qW02ysngSyXHzpcPC7cX1ODARLlxZebihQI2p5WK+iYCIPnGd5LuGUHjoXEK5rOh5YDXNv0SyoewI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Candice.Li@amd.com, Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyBhcmUgdG8gcmVtb3ZlIGFkZGl0aW9uYWwgZXh0ZXJuYWwgbGliLWpzb25j
CmRlcGVuZGVuY2UsIGFuZCB0byBwdXQgYWxsIHRlc3QgY29uZmlndXJhdGlvbnMgaW50byBDIGNv
ZGUuCgpHdWNodW4gQ2hlbiAoNCk6CiAgYW1kZ3B1OiByZW1vdmUganNvbiBwYWNrYWdlIGRlcGVu
ZGVuY2UKICBhbWRncHU6IGRlbGV0ZSB0ZXN0IGNvbmZpZ3VyYXRpb24gZmlsZQogIGFtZGdwdTog
YWRkIHJhcyBpbmplY3QgdW5pdCB0ZXN0CiAgYW1kZ3B1OiBhZGQgcmFzIGZlYXR1cmUgY2FwYWJp
bGl0eSBjaGVjayBpbiBpbmplY3QgdGVzdAoKIGNvbmZpZ3VyZS5hYyAgICAgICAgICAgICB8ICAx
OCAtLS0KIGRhdGEvYW1kZ3B1X3Jhcy5qc29uICAgICB8IDI2NyAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiBtZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAgIDEgLQogdGVzdHMv
YW1kZ3B1L01ha2VmaWxlLmFtIHwgICA1ICstCiB0ZXN0cy9hbWRncHUvbWVzb24uYnVpbGQgfCAg
MTYgKy0KIHRlc3RzL2FtZGdwdS9yYXNfdGVzdHMuYyB8IDMwNSArKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKyks
IDQ5NiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkYXRhL2FtZGdwdV9yYXMuanNv
bgoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
