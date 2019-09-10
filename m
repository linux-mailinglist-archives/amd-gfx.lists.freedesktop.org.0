Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E132BAE520
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 10:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1047A6E863;
	Tue, 10 Sep 2019 08:09:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB786E863
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 08:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtZg09bYbCabo7kjP83p5yccyWkLc0+vX9xu3JOWo49LTjje13MKz53gd9fuRzXuIKL+YkJtxa7WTJcYrrjaDIDwR4Cawzhiyj/T6z7nQN/bcYtA8z4rBb5q66ShaoZBycicAaao+wI/kxWAGblfY3rMy9GEkBjcVL30BUHi5nncreEdR5HPeUfnqL+fVaSWirFprTI+YyKVK7EHBIljffavYGw1iBRGD4frXUoIerUR/wKGSg562U6I+LMcQ/6ddEuN/tpWr67tiZ9hftctskbbZGJIRY4CLtixHvRYDhPUozwbfv2hH90nPRWiMflVIcPfIiAY7ljGs5jx/0gEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9pngzBIdn7mcw5hQPbK25DM6C5fhi1Z3vrpxR5U4sM=;
 b=XrQOSUDMjNn84Zz0RESGdizh2Dp2kw+NnrNxECmY4tq0cIQ5cYN3BWKjZ2/kxzK1nOjLOit9Kim/DLdnreAjJRFQVvwkPygfpXWCOvajZTWJmoR3CgG/F7p8fX6NhI0/pSgenR2/kwz897diGnSp2PUTDzAH7VliE5gnYByOsxUfHy88Bq2a2uO66hQUdZyxUA0x0eMKe3/31Iait4KHqM/fCiqQviYQg8U0vixHd6zkgNXc6bz8t5afVy2EYAtQp1EnnWpLgzIzROICg+dnrTr5q2AV8DNwb7k+ZA/Tj9zZtwvopH4QoZ1V0jrorhAWXBrnIkiOKzIhKRfGna54TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0031.namprd12.prod.outlook.com (2603:10b6:405:70::17)
 by BN6PR12MB1313.namprd12.prod.outlook.com (2603:10b6:404:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14; Tue, 10 Sep
 2019 08:09:29 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by BN6PR12CA0031.outlook.office365.com
 (2603:10b6:405:70::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 08:09:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 08:09:28 +0000
Received: from ubuntu-mi100.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 03:09:26 -0500
From: Jack Zhang <Jack.Zhang1@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sriov: add ring_stop before ring_create in psp v11
 code
Date: Tue, 10 Sep 2019 16:09:22 +0800
Message-ID: <20190910080922.4933-1-Jack.Zhang1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(336012)(126002)(426003)(186003)(16586007)(26005)(316002)(305945005)(4326008)(8676002)(81156014)(50226002)(2351001)(81166006)(2906002)(53416004)(8936002)(86362001)(70206006)(5660300002)(70586007)(50466002)(51416003)(48376002)(36756003)(1076003)(47776003)(478600001)(6916009)(53936002)(2616005)(486006)(476003)(356004)(6666004)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1313; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9217c0f8-1fd9-4d09-6c5a-08d735c63404
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1313; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1313:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1313A21BD7621B17C86F9E7BBBB60@BN6PR12MB1313.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: uwg+uBBUGLlZ1Noz3LUo8yB8o/fCXFuU2m2xFV3qzjeEoCYKQSUtqAdFnT+XRo0NRfeiPPwb1bFZ5p40Y1q015GDHucqmF2lJ1a4VmQdj1iUGgic/wCIOBhGa/S7A9cx9fKDRWPZ9XMPCOCJjbx61i82ji1Ot4nOVFkewLyZIHB0jDEJ4SZboyn+tgfSouqiTB2SoQGsGLHdJ6VhkajCUS6rTyIg/rIHd/h+5XhB0pbgH2Y0QXWG+DwDgz/M+OxXv2r2IUwlgGqlfPr5LkR3B/h5Lx+TFdbZYRz9C+JHGYAU1Yb0xnFOQA2ypGyam0UXvlCP//OM3dVPxb0ByO9+lxdeT+VH/kaW4CI1CLa5HoQ7E5xqWUnz4L/6KokjZPxj5ZN7lIZWeGfbBqM+yT1db0rqEGwMFtx2hGPHMa1zq6U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 08:09:28.6934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9217c0f8-1fd9-4d09-6c5a-08d735c63404
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1313
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9pngzBIdn7mcw5hQPbK25DM6C5fhi1Z3vrpxR5U4sM=;
 b=4glgOblbtcW2uNl/m+p6k7BYBtGJ/v5pJiod9xEqEmoOlFXKj6XCuGp2u77HtucUA86WwQyk6bEAYJ/bo3ugB8GTtQbjzR4UQk9XRSk2ViDWXoB3bIvuiJkmZxezClG7ENSY0QdhZIHsAfI6mGDK05P5UoARyyaXYVBP7Ig+beQ=
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cHNwICB2MTEgY29kZSBtaXNzZWQgcmluZyBzdG9wIGluIHJpbmcgY3JlYXRlIGZ1bmN0aW9uKFZN
UikKd2hpbGUgcHNwIHYzLjEgY29kZSBoYWQgdGhlIGNvZGUuIFRoaXMgd2lsbCBjYXVzZSBWTSBk
ZXN0cm95MQpmYWlsIGFuZCBwc3AgcmluZyBjcmVhdGUgZmFpbC4KCkZvciBTSU9WLVZGLCByaW5n
X3N0b3Agc2hvdWxkIG5vdCBiZSBkZWxldGVkIGluIHJpbmdfY3JlYXRlCmZ1bmN0aW9uLgoKU2ln
bmVkLW9mZi1ieTogSmFjayBaaGFuZyA8SmFjay5aaGFuZzFAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDYxICsrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEx
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCmluZGV4IGNkZGZh
M2MuLjhlOWIzNGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92
MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCkBAIC0z
OTcsNiArMzk3LDM0IEBAIHN0YXRpYyBib29sIHBzcF92MTFfMF9zdXBwb3J0X3Ztcl9yaW5nKHN0
cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCXJldHVybiBmYWxzZTsKIH0KIAorc3RhdGljIGludCBw
c3BfdjExXzBfcmluZ19zdG9wKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAorCQkJICAgICAgZW51
bSBwc3BfcmluZ190eXBlIHJpbmdfdHlwZSkKK3sKKwlpbnQgcmV0ID0gMDsKKwlzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiA9IHBzcC0+YWRldjsKKworCS8qIFdyaXRlIHRoZSByaW5nIGRlc3Ry
b3kgY29tbWFuZCovCisJaWYgKHBzcF92MTFfMF9zdXBwb3J0X3Ztcl9yaW5nKHBzcCkpCisJCVdS
RUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAxLAorCQkJCSAgICAgR0ZYX0NU
UkxfQ01EX0lEX0RFU1RST1lfR1BDT01fUklORyk7CisJZWxzZQorCQlXUkVHMzJfU09DMTUoTVAw
LCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY0LAorCQkJCSAgICAgR0ZYX0NUUkxfQ01EX0lEX0RFU1RS
T1lfUklOR1MpOworCisJLyogdGhlcmUgbWlnaHQgYmUgaGFuZHNoYWtlIGlzc3VlIHdpdGggaGFy
ZHdhcmUgd2hpY2ggbmVlZHMgZGVsYXkgKi8KKwltZGVsYXkoMjApOworCisJLyogV2FpdCBmb3Ig
cmVzcG9uc2UgZmxhZyAoYml0IDMxKSAqLworCWlmIChwc3BfdjExXzBfc3VwcG9ydF92bXJfcmlu
Zyhwc3ApKQorCQlyZXQgPSBwc3Bfd2FpdF9mb3IocHNwLCBTT0MxNV9SRUdfT0ZGU0VUKE1QMCwg
MCwgbW1NUDBfU01OX0MyUE1TR18xMDEpLAorCQkJCSAgIDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAs
IGZhbHNlKTsKKwllbHNlCisJCXJldCA9IHBzcF93YWl0X2Zvcihwc3AsIFNPQzE1X1JFR19PRkZT
RVQoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY0KSwKKwkJCQkgICAweDgwMDAwMDAwLCAweDgw
MDAwMDAwLCBmYWxzZSk7CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgaW50IHBzcF92MTFf
MF9yaW5nX2NyZWF0ZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIAkJCQllbnVtIHBzcF9yaW5n
X3R5cGUgcmluZ190eXBlKQogewpAQCAtNDA2LDYgKzQzNCwxMiBAQCBzdGF0aWMgaW50IHBzcF92
MTFfMF9yaW5nX2NyZWF0ZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIAlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IHBzcC0+YWRldjsKIAogCWlmIChwc3BfdjExXzBfc3VwcG9ydF92bXJf
cmluZyhwc3ApKSB7CisJCXJldCA9IHBzcF92MTFfMF9yaW5nX3N0b3AocHNwLCByaW5nX3R5cGUp
OworCQlpZiAocmV0KSB7CisJCQlEUk1fRVJST1IoInBzcF92MTFfMF9yaW5nX3N0b3Bfc3Jpb3Yg
ZmFpbGVkIVxuIik7CisJCQlyZXR1cm4gcmV0OworCQl9CisKIAkJLyogV3JpdGUgbG93IGFkZHJl
c3Mgb2YgdGhlIHJpbmcgdG8gQzJQTVNHXzEwMiAqLwogCQlwc3BfcmluZ19yZWcgPSBsb3dlcl8z
Ml9iaXRzKHJpbmctPnJpbmdfbWVtX21jX2FkZHIpOwogCQlXUkVHMzJfU09DMTUoTVAwLCAwLCBt
bU1QMF9TTU5fQzJQTVNHXzEwMiwgcHNwX3JpbmdfcmVnKTsKQEAgLTQ1MCwzMyArNDg0LDYgQEAg
c3RhdGljIGludCBwc3BfdjExXzBfcmluZ19jcmVhdGUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3As
CiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBwc3BfdjExXzBfcmluZ19zdG9wKHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwLAotCQkJICAgICAgZW51bSBwc3BfcmluZ190eXBlIHJpbmdfdHlw
ZSkKLXsKLQlpbnQgcmV0ID0gMDsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHBzcC0+
YWRldjsKLQotCS8qIFdyaXRlIHRoZSByaW5nIGRlc3Ryb3kgY29tbWFuZCovCi0JaWYgKHBzcF92
MTFfMF9zdXBwb3J0X3Ztcl9yaW5nKHBzcCkpCi0JCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAw
X1NNTl9DMlBNU0dfMTAxLAotCQkJCSAgICAgR0ZYX0NUUkxfQ01EX0lEX0RFU1RST1lfR1BDT01f
UklORyk7Ci0JZWxzZQotCQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY0
LAotCQkJCSAgICAgR0ZYX0NUUkxfQ01EX0lEX0RFU1RST1lfUklOR1MpOwotCi0JLyogdGhlcmUg
bWlnaHQgYmUgaGFuZHNoYWtlIGlzc3VlIHdpdGggaGFyZHdhcmUgd2hpY2ggbmVlZHMgZGVsYXkg
Ki8KLQltZGVsYXkoMjApOwotCi0JLyogV2FpdCBmb3IgcmVzcG9uc2UgZmxhZyAoYml0IDMxKSAq
LwotCWlmIChwc3BfdjExXzBfc3VwcG9ydF92bXJfcmluZyhwc3ApKQotCQlyZXQgPSBwc3Bfd2Fp
dF9mb3IocHNwLCBTT0MxNV9SRUdfT0ZGU0VUKE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18xMDEp
LAotCQkJCSAgIDB4ODAwMDAwMDAsIDB4ODAwMDAwMDAsIGZhbHNlKTsKLQllbHNlCi0JCXJldCA9
IHBzcF93YWl0X2Zvcihwc3AsIFNPQzE1X1JFR19PRkZTRVQoTVAwLCAwLCBtbU1QMF9TTU5fQzJQ
TVNHXzY0KSwKLQkJCQkgICAweDgwMDAwMDAwLCAweDgwMDAwMDAwLCBmYWxzZSk7Ci0KLQlyZXR1
cm4gcmV0OwotfQogCiBzdGF0aWMgaW50IHBzcF92MTFfMF9yaW5nX2Rlc3Ryb3koc3RydWN0IHBz
cF9jb250ZXh0ICpwc3AsCiAJCQkJIGVudW0gcHNwX3JpbmdfdHlwZSByaW5nX3R5cGUpCi0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
