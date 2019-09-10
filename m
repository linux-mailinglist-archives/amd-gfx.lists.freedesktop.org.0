Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EDFAEC6D
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587D66E082;
	Tue, 10 Sep 2019 13:55:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720040.outbound.protection.outlook.com [40.107.72.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E90989336
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgapAVRcAfkPvM63D/zMgQR5cBGX7RB48ZgvV7CS8ESWZBhuI4sxTWsT5+eSm+0lreNg9YK/SkEos0LfItdK7J/zoMghR/EN1V7ie0WsPOUe21zjLCxirEc2S3zYlonjALoqKpkH/EWdCx59/j6KXtnoKKyzdBHzOKe0mn0GgbnGyeQ77F3BUsHjYja4EQfhvblmY34uJtk3kmeqKoNVz/7dChPrIhgenkz6CgOUXxoFiC0WdqFiS30hHNTovurv6jkLgY0u1+ipXHtIBp3jN8ocChh8b2Zci7p6jHq1X7jYBfnAV1aNEggDGJD+Ps/wUaopDE+8W47NPWZd3NwUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF3PncDmU7fTOD3TkxjJUYrVtKPwUq8ut2sNiGcE6kU=;
 b=J0bpgQCAb2eBdeH4cIE7yMUNrbwn7SzE6hv5uxLWXHM0mnCGFgw13mxtjuOHsch7gdX5I/apZwth87ihdseq+/V7dzugGVVhY7szVSkjhh8lIWtmXxT4Ol+6FE7BjSB8PBC6BJbFdgFY/cY5MBxy777QS2AWqcvgsX/FdFhVzCoK8oV5emenjLbLcjPWAPWBxPyYqV68NHxYuQrQHql+GMZkDj8gCBsv6w3lAYm+TgtuoqzghknTEzuBC/9pWbisWgylZYmNy9d2IMsOnhcd2AhtMJf13j79ekusbab9XT0JxAmaF+VwzFo6i8Xf3a5JDcI5oEmSiIO58ZOuu1dSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by MN2PR12MB4029.namprd12.prod.outlook.com (2603:10b6:208:16e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 13:55:02 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:02 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:56 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/25] drm/amd/display: fix global sync param extraction
 indexing
Date: Tue, 10 Sep 2019 09:54:29 -0400
Message-ID: <20190910135445.18300-10-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(428003)(199004)(189003)(486006)(1076003)(70586007)(478600001)(49486002)(2870700001)(26005)(6666004)(476003)(2616005)(47776003)(126002)(53936002)(426003)(336012)(70206006)(54906003)(316002)(2906002)(11346002)(81166006)(446003)(86362001)(48376002)(76176011)(50226002)(50466002)(356004)(4326008)(6916009)(186003)(8936002)(5660300002)(8676002)(2876002)(36756003)(2351001)(305945005)(81156014)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4029; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7316367c-b96c-49d5-476a-08d735f67a25
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB4029; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB4029:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4029EED0DD47F69B89B0796D82B60@MN2PR12MB4029.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Y8jPrXu7jEwvh1jWe5xiOZ/BmI8cqUKo35+vAaPOgHKxV94nOT7wH6YOnKhJWwR1bRLp7DPOELxqj1t98k1GABQzG7SoGC5UDTCG2OUR04DW93BjnpVfBwg4PFGIlfZEX4D6+tYmkOq7sShA7UTelExSyOYwHOCoj6afp7CYjBrrAcngibDdPBPouWYrHwSBm4o5UZh6m25I8wzQFr4qJrJtIpnEslyJ/3TyqBBToFDC0dtw0J7PGtaGMcrQWo1uS2RfX8ulG9yUt4ef3DGsWyN0WnH0O1+NuZU8gi0/h5PYUlaaqJ2QSwF0aQWXHtvKJC4g9MMop8ksenytVtOA6uyvF9VcdoTsMHpyhTkazDur/C+Tl1Ev6FZlh7jdr9nZeS7OoTRD9pjQzt77zNsbPqoC8aXc67SIe6T7UXfVup8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:02.1272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7316367c-b96c-49d5-476a-08d735f67a25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4029
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF3PncDmU7fTOD3TkxjJUYrVtKPwUq8ut2sNiGcE6kU=;
 b=qRiWHWYlqv5OdKFmCxSFJUOqcvnc8+/zfXjDrR89b92WG4peUqST0NewHuqS6hEEIy6J+GV1vhNcCXL5wMNZmKBp3r0z1dC7NDmM1XmzyPvTYKOouJ4cbvsFcPUAY2YCszY7djH5aDr5EiCAmvuXsmLM/nZ5nUdIo8y5UVWVi98=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Jaehyun Chung <Jaehyun.Chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCmRj
bjIwX2NhbGN1bGF0ZV9kbGdfcGFyYW1zIHdhcyBpbmNvcnJlY3RseSBpbmRleGluZyBwaXBlIHNy
YyBhbmQKZHN0IHN0cnVjdHMgd2hlbiBleHRyYWN0aW5nIGdsb2JhbCBzeW5jIHBhcmFtcy4KClNp
Z25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBKYWVoeXVuIENodW5nIDxKYWVoeXVuLkNodW5nQGFtZC5jb20+CkFj
a2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDlh
Y2ViMTU5YmVmNS4uNDlhMTQ3NjYxY2Q0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMjYzOCw4ICsyNjM4LDgg
QEAgdm9pZCBkY24yMF9jYWxjdWxhdGVfZGxnX3BhcmFtcygKIAkJCWNvbnRpbnVlOwogCiAJCWlm
ICghdmlzaXRlZFtwaXBlX2lkeF0pIHsKLQkJCWRpc3BsYXlfcGlwZV9zb3VyY2VfcGFyYW1zX3N0
ICpzcmMgPSAmcGlwZXNbcGlwZV9pZHhfdW5zcGxpdF0ucGlwZS5zcmM7Ci0JCQlkaXNwbGF5X3Bp
cGVfZGVzdF9wYXJhbXNfc3QgKmRzdCA9ICZwaXBlc1twaXBlX2lkeF91bnNwbGl0XS5waXBlLmRl
c3Q7CisJCQlkaXNwbGF5X3BpcGVfc291cmNlX3BhcmFtc19zdCAqc3JjID0gJnBpcGVzW3BpcGVf
aWR4XS5waXBlLnNyYzsKKwkJCWRpc3BsYXlfcGlwZV9kZXN0X3BhcmFtc19zdCAqZHN0ID0gJnBp
cGVzW3BpcGVfaWR4XS5waXBlLmRlc3Q7CiAKIAkJCWRzdC0+dnN0YXJ0dXBfc3RhcnQgPSBjb250
ZXh0LT5id19jdHguZG1sLnZiYS5WU3RhcnR1cFtwaXBlX2lkeF91bnNwbGl0XTsKIAkJCWRzdC0+
dnVwZGF0ZV9vZmZzZXQgPSBjb250ZXh0LT5id19jdHguZG1sLnZiYS5WVXBkYXRlT2Zmc2V0UGl4
W3BpcGVfaWR4X3Vuc3BsaXRdOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
