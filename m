Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55CC1C75B
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 12:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4AC8926F;
	Tue, 14 May 2019 10:59:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800085.outbound.protection.outlook.com [40.107.80.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6058926F
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 10:59:26 +0000 (UTC)
Received: from DM3PR12CA0120.namprd12.prod.outlook.com (2603:10b6:0:51::16) by
 BN6PR1201MB0050.namprd12.prod.outlook.com (2603:10b6:405:4e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.21; Tue, 14 May
 2019 10:59:25 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0120.outlook.office365.com
 (2603:10b6:0:51::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Tue, 14 May 2019 10:59:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 14 May 2019 10:59:24 +0000
Received: from gamma.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 14 May 2019
 05:59:23 -0500
From: Tiecheng Zhou <Tiecheng.Zhou@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sriov: Need to initialize the HDP_NONSURFACE_BAStE
Date: Tue, 14 May 2019 18:59:19 +0800
Message-ID: <1557831559-6925-1-git-send-email-Tiecheng.Zhou@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(486006)(186003)(68736007)(70586007)(478600001)(47776003)(336012)(36756003)(2906002)(77096007)(51416003)(26005)(316002)(7696005)(426003)(6666004)(356004)(70206006)(4326008)(5660300002)(86362001)(16586007)(8936002)(72206003)(2616005)(8676002)(53936002)(2351001)(53416004)(48376002)(305945005)(6916009)(50466002)(50226002)(476003)(126002)(81166006)(81156014)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0050; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7ef5a55-ed7d-4706-7f7f-08d6d85b3a17
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR1201MB0050; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0050:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0050A7E9B0F8DD0A31174F12E4080@BN6PR1201MB0050.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0037FD6480
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yBq9V49KjYMD69jNhEVgJyYkqEZZDQTcJCb4cOfpHU+0TOaaVYY2cxra2mgSgffkUfSVEJv8ApXeKI2gun+bKOF1eIbeGF4J2vKGyRS90NL/Ud+AwKifiAJeTETvDhyh/4wqbCHNdqHecHEMgdBgJ0+RU8JF4TJcSXymBXMr5xDga3n7EfwXtYMjF1Sk4j6L77mnRS2gR+bzXAcJ1Gz/hNr7+Cy2I+y2FhCs4Ubr19y7fJsX5moztsBe/tGynkknapPr1HojTC+b4s6WjJcTY7ghQLyQLxlMa+bF+uhDoOC48jQUcgGOyMj3SNl1ZO2LM02MkFLrJK8eGZses8fWhhDSKQS1ixbY0eSL/CwkV6NxWQpn3AvT/2GDIWbCOohmVkSehFG9sbQqEK6WklmOzJ07e22/bLl8JKYLmMa06WA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2019 10:59:24.6204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ef5a55-ed7d-4706-7f7f-08d6d85b3a17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0050
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiQurM+CnOwWAKfe/4yZfW1f+dnRtLv+Vj2DTckkd50=;
 b=yqOX9bSSzkFHTcYiOt2A4HKVLZ7yPYe0gkARmE3eX64D2Nk7zuK55mdsImYxYi0iT1hqBNpX14YLhDpfDx7GLaxIgH6pO/KbCyfN947mfZWTeSeGIlLY0Ousvqfr/cV4IsufWaZAkNAxugObBJxZN7GblyczYTSH7CEcwhTLTQk=
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
Cc: Tiecheng Zhou <Tiecheng.Zhou@amd.com>, Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aXQgcmVxdWlyZXMgdG8gaW5pdGlhbGl6ZSBIRFBfTk9OU1VSRkFDRV9CQVNFLCBzbyBhcyB0byBh
dm9pZAp1c2luZyB0aGUgdmFsdWUgbGVmdCBieSBhIHByZXZpb3VzIFZNIHVuZGVyIHNyaW92IHNj
ZW5hcmlvLgoKdjI6IGl0IHNob3VsZCBub3QgaHVydCBiYXJlbWV0YWwsIGdlbmVyYWxpemUgaXQg
Zm9yIGJvdGggc3Jpb3YKYW5kIGJhcmVtZXRhbAoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8
RW1pbHkuRGVuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaWVjaGVuZyBaaG91IDxUaWVjaGVu
Zy5aaG91QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggYmU3MjllNy4uYzIyMTU3MCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC0xMTgxLDYgKzExODEsOSBAQCBzdGF0aWMgaW50
IGdtY192OV8wX2dhcnRfZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXRtcCA9
IFJSRUczMl9TT0MxNShIRFAsIDAsIG1tSERQX0hPU1RfUEFUSF9DTlRMKTsKIAlXUkVHMzJfU09D
MTUoSERQLCAwLCBtbUhEUF9IT1NUX1BBVEhfQ05UTCwgdG1wKTsKIAorCVdSRUczMl9TT0MxNShI
RFAsIDAsIG1tSERQX05PTlNVUkZBQ0VfQkFTRSwgKGFkZXYtPmdtYy52cmFtX3N0YXJ0ID4+IDgp
KTsKKwlXUkVHMzJfU09DMTUoSERQLCAwLCBtbUhEUF9OT05TVVJGQUNFX0JBU0VfSEksIChhZGV2
LT5nbWMudnJhbV9zdGFydCA+PiA0MCkpOworCiAJLyogQWZ0ZXIgSERQIGlzIGluaXRpYWxpemVk
LCBmbHVzaCBIRFAuKi8KIAlhZGV2LT5uYmlvX2Z1bmNzLT5oZHBfZmx1c2goYWRldiwgTlVMTCk7
CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
