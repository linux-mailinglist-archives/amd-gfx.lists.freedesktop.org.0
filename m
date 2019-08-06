Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795CE82CE8
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 09:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC0A6E313;
	Tue,  6 Aug 2019 07:37:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730044.outbound.protection.outlook.com [40.107.73.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E596E313
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 07:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG/3BD42/z3W2K7ELfkO6wfu8tSyBlgRDfzLhqKtIKb+zJXnWZZnhR6Ipv/EMgXs6YENMSM9ngHB2EiteUxCzen0y4lsdFnNf+IF2ABjJo7waRdIlUZ/43Tia3LTGL/eLLOKQi3ALTYGmiv1cu3EpNAskad2bHmOP4MLYbf+KVJNNpwmm9RZZXrRjXCrkzjdUxsSYXpx+F+9vygGHO8xiBa9shAZxU90iO+MYSY4O1iu/F4qmCE0pQRf5dM4hEIwJW+ThcT4OJrwjF8lMOKSrAz0qGKGxwNxiMKibCr0dg/Rnc817Up+KNIu+yscN6aGlqHm0mFbiQqKkapPrsdW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0i72usr96wV08gCh8xIpwt9GU7nvAyUwpP/l/NbdvrA=;
 b=Dkoj5HKJEWNzX+f/YtwL4mGDEgpP/o9JuZz1nQAPGhILKv4W/6CdDo9M9L0C8iNzvURThZW7SEDo+ZEmDOCYN8bhPbbET5X8Lc2gYj4VQXc0ySRgptWdfzwNb1iXpkpaQk1QhDzwq4Xu8ivcNltm7u5UelIj2X7/JxJgtvFlZetLI6v8tp06NpjI3yNCTbVpdDKD6dMKHLxXt6hBywXvWPpzH4BizaPXJDkYOKoJYjrDRF9jJowAIKprYbBXYoOtRJqIBLlhyE4kqa3P6oeb8ZII6NzcRRJhd0LuCCz/2GSKzAJR7zCCNMu9DdWSeYXDT7QpKnBhd/ayGyXXb5ym3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0063.namprd12.prod.outlook.com (2603:10b6:300:103::25)
 by BN6PR12MB1363.namprd12.prod.outlook.com (2603:10b6:404:1f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Tue, 6 Aug
 2019 07:37:48 +0000
Received: from DM3NAM03FT055.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR12CA0063.outlook.office365.com
 (2603:10b6:300:103::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.16 via Frontend
 Transport; Tue, 6 Aug 2019 07:37:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT055.mail.protection.outlook.com (10.152.83.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Tue, 6 Aug 2019 07:37:47 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Tue, 6 Aug 2019 02:37:46 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <Xinhui.Pan@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH libdrm 3/3] amdgpu: add umc ras eject test configuration
Date: Tue, 6 Aug 2019 15:36:29 +0800
Message-ID: <20190806073629.10976-4-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806073629.10976-1-guchun.chen@amd.com>
References: <20190806073629.10976-1-guchun.chen@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(4326008)(110136005)(47776003)(81166006)(81156014)(6636002)(336012)(68736007)(26005)(70586007)(6666004)(356004)(44832011)(53936002)(1076003)(2201001)(2616005)(186003)(426003)(446003)(8676002)(4744005)(486006)(11346002)(70206006)(76176011)(51416003)(7696005)(53416004)(36756003)(5660300002)(316002)(50226002)(50466002)(126002)(478600001)(476003)(48376002)(8936002)(16586007)(86362001)(305945005)(54906003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1363; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b54ecb3-db59-4c42-20f6-08d71a40fa78
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1363; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1363:
X-Microsoft-Antispam-PRVS: <BN6PR12MB13634F889C62500372BB5A7CF1D50@BN6PR12MB1363.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-Forefront-PRVS: 0121F24F22
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: B/x9bk/k8Eep6iwnmmS4Xim1fHFP0NkiJ8bQNmEoNINybhge4IauSnhL7pMYNfCYsHV5QP+xtHVVrU/b6s62kWnHbmCUgClaTh4M2C/fmzCqmJ4ea/51z+8sgeK0kZH/puLsoj4NxfGpFYZYdB4pA9e0L2EVHTQrg0zIb6g1XX81B61Wm4OGUTiqOR+qhZC0VBk6EexV74vQoGSpEWWWbBQKKhS/vr4l8l+MLFF4hS/2/uHwxLejvqg05vIc8cNV4RUaVCT4ciPmBArwQi0i7a9e2T1Mk6VmgmCycyIqoZMr/NlR/06iJOCrtIZvR8sjz5VK3k9lDxj+5vdYbiD1WAUiOXFtfD+MnCp7wynabCU1+jO02BCEEBhAthAb3PBvCJy1+VEewpF8sV7xIKyJ4l1DEqGxI7+ygCljaDRiZZI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2019 07:37:47.7639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b54ecb3-db59-4c42-20f6-08d71a40fa78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1363
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0i72usr96wV08gCh8xIpwt9GU7nvAyUwpP/l/NbdvrA=;
 b=DIkcO4ebqbQliJoKQGF6zeJC55sCShS7mxTjC06UfHaj+wWu3VkF0DoedLvOe6oVRERbGxFF9kAprlr7Agk2DzvuDx8KcJ1ohnYhUNPyTM7nEg2a9KiYPJ5zCVGvwz1hiBNxVz3dz893cOK/VkmRKy6CXpyhquHEe7OrF1OMT7Y=
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
Cc: Dennis Li <dennis.li@amd.com>, Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJNzc5ZjJmNGY1OWM2OWZiMDhmZGMwOWI3YWRiYTViMzZlM2FmMjBjZQpTaWdu
ZWQtb2ZmLWJ5OiBEZW5uaXMgTGkgPGRlbm5pcy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBH
dWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4KLS0tCiBkYXRhL2FtZGdwdV9yYXMuanNv
biB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZGF0YS9hbWRncHVfcmFzLmpzb24gYi9kYXRhL2FtZGdwdV9yYXMuanNvbgppbmRl
eCAwODYzYTE4Mi4uM2QwOTA5OTQgMTAwNjQ0Ci0tLSBhL2RhdGEvYW1kZ3B1X3Jhcy5qc29uCisr
KyBiL2RhdGEvYW1kZ3B1X3Jhcy5qc29uCkBAIC0xLDYgKzEsOSBAQAogewogICAgICJ2ZXJzaW9u
IjogIjAuMC4xIiwKICAgICAiYmxvY2siOiB7CisgICAgICAgICJ1bWMiOiB7CisgICAgICAgICAg
ICAiaW5kZXgiOiAwCisgICAgICAgIH0sCiAgICAgICAgICJnZngiOiB7CiAgICAgICAgICAgICAi
aW5kZXgiOiAyLAogICAgICAgICAgICAgInN1YmJsb2NrIjogewpAQCAtMTI2LDYgKzEyOSwxMyBA
QAogICAgICAgICAicG9pc29uIjogOAogICAgIH0sCiAgICAgInRlc3RzIjogWworICAgICAgICB7
CisgICAgICAgICAgICAibmFtZSI6ICJyYXNfdW1jLjEuMCIsCisgICAgICAgICAgICAiYmxvY2si
OiAidW1jIiwKKyAgICAgICAgICAgICJ0eXBlIjogInNpbmdsZV9jb3JyZWN0YWJsZSIsCisgICAg
ICAgICAgICAiYWRkcmVzcyI6IDAsCisgICAgICAgICAgICAidmFsdWUiOiAwCisgICAgICAgIH0s
CiAgICAgICAgIHsKICAgICAgICAgICAgICJuYW1lIjogInJhc19nZnguMi4xIiwKICAgICAgICAg
ICAgICJibG9jayI6ICJnZngiLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
