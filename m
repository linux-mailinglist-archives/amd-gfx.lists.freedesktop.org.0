Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88DA027C
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F2189C3B;
	Wed, 28 Aug 2019 13:03:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710062.outbound.protection.outlook.com [40.107.71.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB8689C3B
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyXSF/j+tN7Vu4CPVKHYlE1P4sTkkw7Zbs0z7s9hjf9WoI1jVAdBPKOnPuXSnse9Y5KlawpuvQvXJH3dIkq0SzEffWFYIa7ncFxmd/BXg5fORqhXiJLn2LZ2w9l6G/XcEOvfGm2BEQ5iJ9v3JEv+0gmK5JMWBDnI07UOW8fScDJCHpdCRNUcYS1OALBjF95Ry7lWThQbCQ+5xtMU9mIW1JzNmHQAHRbV971O0YOImM4vj5oT5jQFmBF89Uf2Gkou/KlqUvtU8qK98GA7Y0hkRu57BnbitbEBHu0xHdbRgNgxQE/YlzBNteXZH7X72N3zdgOXWqSnqxbGzI+RQIurLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL8noQ+zibHLUGEHQp8XPUCowckn1O9FRKCk4//WTw0=;
 b=NGQgmy0kaT8UubXE4gvq35DHyrTefha9X1FIkwgkRawn88mhFgqiSdbAqfKmWO1S8iuUpX98/QAkU4LcycEQiZUOGlj9mJh0gwgYB1Vm3QVOS9vrlyl/muaHfGPYtXpVzK5EjFxdwrDFUnynM0O9hv+VKYmOgIAxx/6Lqi8pDuDkZRotbA/fPvLlZHEAbtBNdyoAtH1CF8VEzIYS1q5hISsj0TaX8aXXXKt2DgmhlJziKygM32c2RrXSYalUvlLPHzGPYvaC77wgoPD4YhiyhOnxuXJb1kpew1lNbo/UuHnNYVPYaPwFnXB79J6/x1mNeRzGfG7YOAdkD/iTP7fGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0062.namprd12.prod.outlook.com (2603:10b6:0:56::30) by
 MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 28 Aug 2019 13:03:37 +0000
Received: from BY2NAM03FT034.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by DM3PR12CA0062.outlook.office365.com
 (2603:10b6:0:56::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 13:03:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT034.mail.protection.outlook.com (10.152.84.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 13:03:36 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 28 Aug 2019 08:03:35 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Tao Zhou <tao.zhou1@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 4/7] drm/amdgpu: switch to ras_late_init for gmc v9
Date: Wed, 28 Aug 2019 21:03:12 +0800
Message-ID: <1566997395-7185-4-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(446003)(426003)(316002)(51416003)(305945005)(11346002)(6636002)(2616005)(16586007)(7696005)(8936002)(478600001)(81166006)(50226002)(476003)(2906002)(110136005)(53416004)(76176011)(36756003)(81156014)(126002)(8676002)(336012)(186003)(486006)(70206006)(70586007)(50466002)(26005)(48376002)(356004)(6666004)(5660300002)(47776003)(86362001)(4326008)(14444005)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffa69a22-f890-4748-2451-08d72bb8239c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1278116EE841F107FE128242FCA30@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:499;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KW6l4mFC5tMqZyr/SZIzAmCchlqcMANiEYeVs5p0I/Hz33YnPpz3n4pJOBCetLC8qg9TBrfn/6N4cV9NxcEdKguCZ8WrCaa/lQUe+pNzMsWWkORVBBUN2W2zKEuwfe4kcV3AU88HEk8HjQjPoeNWbviEcuH+3y540d1R+1nrWR/LqshTgr7Oe4HPfcGpLAKxnA4OvF0+g1Q/kBvVBUCJGEAV7g1jaDXyB6b15ZLwVBXwTF+c/67exWZwxfdtZWcwbgduV227hVzgPLcNic0JVcj4KeSDLdsEsIG/FR7kKT76gjoRmAtssEWBUsVI5jCPPxJtCQvIlqiZKzDmarwp0Qz1v9jk5Uzp6u5tZEoWCyRy6PlHHjfqXcrdPWvvYdL3dbnAF6FF01Wr+OPkarNhXFn1ZmZ0oYXpkkjzNIKGuuw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 13:03:36.4944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa69a22-f890-4748-2451-08d72bb8239c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL8noQ+zibHLUGEHQp8XPUCowckn1O9FRKCk4//WTw0=;
 b=jWGC7Fap3RDAlDivqNgHZpOsKPYod3dLFVdBzlWJD7nH3pdq8kM/WoGx5hp+SH8IrlSlaZnhtmjqyESVnFLF27gbYnDzL/1E6HXXOy0ZeFaMKXQmPwL80efhmxooHvDaYu2Qc3ZIv/yqqYRE8fszwpsNM8VlbGfqCubi75lH0vs=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2FsbCBhbWRncHVfcmFzX2xhdGVfaW5pdCB0byBkbyByYXMgaW5pdCBmb3IgZ21jIHY5IGJsb2Nr
CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDE1NSArKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygr
KSwgMTEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmlu
ZGV4IGU5N2MzYzguLjhkYzEzZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwpAQCAtNzU4LDEzMyArNzU4LDY0IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfYWxsb2NhdGVfdm1f
aW52X2VuZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4gMDsKIH0KIAotc3Rh
dGljIGludCBnbWNfdjlfMF9lY2NfcmFzX2Jsb2NrX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUsCi0J
CQlzdHJ1Y3QgcmFzX2ZzX2lmICpmc19pbmZvLCBzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2Js
b2NrKQotewotCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2
aWNlICopaGFuZGxlOwotCXN0cnVjdCByYXNfY29tbW9uX2lmICoqcmFzX2lmID0gTlVMTDsKLQlz
dHJ1Y3QgcmFzX2loX2lmIGloX2luZm8gPSB7Ci0JCS5jYiA9IGdtY192OV8wX3Byb2Nlc3NfcmFz
X2RhdGFfY2IsCi0JfTsKLQlpbnQgcjsKLQotCWlmIChyYXNfYmxvY2stPmJsb2NrID09IEFNREdQ
VV9SQVNfQkxPQ0tfX1VNQykKLQkJcmFzX2lmID0gJmFkZXYtPmdtYy51bWNfcmFzX2lmOwotCWVs
c2UgaWYgKHJhc19ibG9jay0+YmxvY2sgPT0gQU1ER1BVX1JBU19CTE9DS19fTU1IVUIpCi0JCXJh
c19pZiA9ICZhZGV2LT5nbWMubW1odWJfcmFzX2lmOwotCWVsc2UKLQkJQlVHKCk7Ci0KLQlpZiAo
IWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIHJhc19ibG9jay0+YmxvY2spKSB7Ci0JCWFt
ZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25fYm9vdChhZGV2LCByYXNfYmxvY2ssIDApOwotCQly
ZXR1cm4gMDsKLQl9Ci0KLQkvKiBoYW5kbGUgcmVzdW1lIHBhdGguICovCi0JaWYgKCpyYXNfaWYp
IHsKLQkJLyogcmVzZW5kIHJhcyBUQSBlbmFibGUgY21kIGR1cmluZyByZXN1bWUuCi0JCSAqIHBy
ZXBhcmUgdG8gaGFuZGxlIGZhaWx1cmUuCi0JCSAqLwotCQlpaF9pbmZvLmhlYWQgPSAqKnJhc19p
ZjsKLQkJciA9IGFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25fYm9vdChhZGV2LCAqcmFzX2lm
LCAxKTsKLQkJaWYgKHIpIHsKLQkJCWlmIChyID09IC1FQUdBSU4pIHsKLQkJCQkvKiByZXF1ZXN0
IGEgZ3B1IHJlc2V0LiB3aWxsIHJ1biBhZ2Fpbi4gKi8KLQkJCQlhbWRncHVfcmFzX3JlcXVlc3Rf
cmVzZXRfb25fYm9vdChhZGV2LAotCQkJCQkJcmFzX2Jsb2NrLT5ibG9jayk7Ci0JCQkJcmV0dXJu
IDA7Ci0JCQl9Ci0JCQkvKiBmYWlsIHRvIGVuYWJsZSByYXMsIGNsZWFudXAgYWxsLiAqLwotCQkJ
Z290byBpcnE7Ci0JCX0KLQkJLyogZW5hYmxlIHN1Y2Nlc3NmdWxseS4gY29udGludWUuICovCi0J
CWdvdG8gcmVzdW1lOwotCX0KLQotCSpyYXNfaWYgPSBrbWFsbG9jKHNpemVvZigqKnJhc19pZiks
IEdGUF9LRVJORUwpOwotCWlmICghKnJhc19pZikKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQkqKnJh
c19pZiA9ICpyYXNfYmxvY2s7Ci0KLQlyID0gYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZV9vbl9i
b290KGFkZXYsICpyYXNfaWYsIDEpOwotCWlmIChyKSB7Ci0JCWlmIChyID09IC1FQUdBSU4pIHsK
LQkJCWFtZGdwdV9yYXNfcmVxdWVzdF9yZXNldF9vbl9ib290KGFkZXYsCi0JCQkJCXJhc19ibG9j
ay0+YmxvY2spOwotCQkJciA9IDA7Ci0JCX0KLQkJZ290byBmZWF0dXJlOwotCX0KLQotCWloX2lu
Zm8uaGVhZCA9ICoqcmFzX2lmOwotCWZzX2luZm8tPmhlYWQgPSAqKnJhc19pZjsKLQotCWlmIChy
YXNfYmxvY2stPmJsb2NrID09IEFNREdQVV9SQVNfQkxPQ0tfX1VNQykgewotCQlyID0gYW1kZ3B1
X3Jhc19pbnRlcnJ1cHRfYWRkX2hhbmRsZXIoYWRldiwgJmloX2luZm8pOwotCQlpZiAocikKLQkJ
CWdvdG8gaW50ZXJydXB0OwotCX0KLQotCWFtZGdwdV9yYXNfZGVidWdmc19jcmVhdGUoYWRldiwg
ZnNfaW5mbyk7Ci0KLQlyID0gYW1kZ3B1X3Jhc19zeXNmc19jcmVhdGUoYWRldiwgZnNfaW5mbyk7
Ci0JaWYgKHIpCi0JCWdvdG8gc3lzZnM7Ci1yZXN1bWU6Ci0JaWYgKHJhc19ibG9jay0+YmxvY2sg
PT0gQU1ER1BVX1JBU19CTE9DS19fVU1DKSB7Ci0JCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAm
YWRldi0+Z21jLmVjY19pcnEsIDApOwotCQlpZiAocikKLQkJCWdvdG8gaXJxOwotCX0KLQotCXJl
dHVybiAwOwotaXJxOgotCWFtZGdwdV9yYXNfc3lzZnNfcmVtb3ZlKGFkZXYsICpyYXNfaWYpOwot
c3lzZnM6Ci0JYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlbW92ZShhZGV2LCAqcmFzX2lmKTsKLQlpZiAo
cmFzX2Jsb2NrLT5ibG9jayA9PSBBTURHUFVfUkFTX0JMT0NLX19VTUMpCi0JCWFtZGdwdV9yYXNf
aW50ZXJydXB0X3JlbW92ZV9oYW5kbGVyKGFkZXYsICZpaF9pbmZvKTsKLWludGVycnVwdDoKLQlh
bWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlKGFkZXYsICpyYXNfaWYsIDApOwotZmVhdHVyZToKLQlr
ZnJlZSgqcmFzX2lmKTsKLQkqcmFzX2lmID0gTlVMTDsKLQlyZXR1cm4gcjsKLX0KLQogc3RhdGlj
IGludCBnbWNfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIHsKIAlpbnQgcjsKLQor
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFu
ZGxlOworCXN0cnVjdCByYXNfaWhfaWYgbW1odWJfaWhfaW5mbzsKIAlzdHJ1Y3QgcmFzX2ZzX2lm
IHVtY19mc19pbmZvID0gewogCQkuc3lzZnNfbmFtZSA9ICJ1bWNfZXJyX2NvdW50IiwKIAkJLmRl
YnVnZnNfbmFtZSA9ICJ1bWNfZXJyX2luamVjdCIsCiAJfTsKLQlzdHJ1Y3QgcmFzX2NvbW1vbl9p
ZiB1bWNfcmFzX2Jsb2NrID0gewotCQkuYmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19VTUMsCi0J
CS50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRSwKLQkJLnN1Yl9i
bG9ja19pbmRleCA9IDAsCi0JCS5uYW1lID0gInVtYyIsCisJc3RydWN0IHJhc19paF9pZiB1bWNf
aWhfaW5mbyA9IHsKKwkJLmNiID0gZ21jX3Y5XzBfcHJvY2Vzc19yYXNfZGF0YV9jYiwKIAl9Owog
CXN0cnVjdCByYXNfZnNfaWYgbW1odWJfZnNfaW5mbyA9IHsKIAkJLnN5c2ZzX25hbWUgPSAibW1o
dWJfZXJyX2NvdW50IiwKIAkJLmRlYnVnZnNfbmFtZSA9ICJtbWh1Yl9lcnJfaW5qZWN0IiwKIAl9
OwotCXN0cnVjdCByYXNfY29tbW9uX2lmIG1taHViX3Jhc19ibG9jayA9IHsKLQkJLmJsb2NrID0g
QU1ER1BVX1JBU19CTE9DS19fTU1IVUIsCi0JCS50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVM
VElfVU5DT1JSRUNUQUJMRSwKLQkJLnN1Yl9ibG9ja19pbmRleCA9IDAsCi0JCS5uYW1lID0gIm1t
aHViIiwKLQl9OwogCi0JciA9IGdtY192OV8wX2VjY19yYXNfYmxvY2tfbGF0ZV9pbml0KGhhbmRs
ZSwKLQkJCSZ1bWNfZnNfaW5mbywgJnVtY19yYXNfYmxvY2spOworCWlmICghYWRldi0+Z21jLnVt
Y19yYXNfaWYpIHsKKwkJYWRldi0+Z21jLnVtY19yYXNfaWYgPSBrbWFsbG9jKHNpemVvZihzdHJ1
Y3QgcmFzX2NvbW1vbl9pZiksIEdGUF9LRVJORUwpOworCQlpZiAoIWFkZXYtPmdtYy51bWNfcmFz
X2lmKQorCQkJcmV0dXJuIC1FTk9NRU07CisJCWFkZXYtPmdtYy51bWNfcmFzX2lmLT5ibG9jayA9
IEFNREdQVV9SQVNfQkxPQ0tfX1VNQzsKKwkJYWRldi0+Z21jLnVtY19yYXNfaWYtPnR5cGUgPSBB
TURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJFQ1RBQkxFOworCQlhZGV2LT5nbWMudW1jX3Jh
c19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsKKwkJc3RyY3B5KGFkZXYtPmdtYy51bWNfcmFzX2lm
LT5uYW1lLCAidW1jIik7CisJfQorCXVtY19paF9pbmZvLmhlYWQgPSB1bWNfZnNfaW5mby5oZWFk
ID0gKmFkZXYtPmdtYy51bWNfcmFzX2lmOworCisJciA9IGFtZGdwdV9yYXNfbGF0ZV9pbml0KGFk
ZXYsIGFkZXYtPmdtYy51bWNfcmFzX2lmLAorCQkJCSAmdW1jX2ZzX2luZm8sICZ1bWNfaWhfaW5m
byk7CiAJaWYgKHIpCi0JCXJldHVybiByOworCQlnb3RvIGZyZWU7CiAKLQlyID0gZ21jX3Y5XzBf
ZWNjX3Jhc19ibG9ja19sYXRlX2luaXQoaGFuZGxlLAotCQkJJm1taHViX2ZzX2luZm8sICZtbWh1
Yl9yYXNfYmxvY2spOworCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5n
bWMudW1jX3Jhc19pZi0+YmxvY2spKSB7CisJCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRl
di0+Z21jLmVjY19pcnEsIDApOworCQlpZiAocikKKwkJCWdvdG8gZnJlZTsKKwl9CisKKwlpZiAo
IWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYpIHsKKwkJYWRldi0+Z21jLm1taHViX3Jhc19pZiA9IGtt
YWxsb2Moc2l6ZW9mKHN0cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5FTCk7CisJCWlmICgh
YWRldi0+Z21jLm1taHViX3Jhc19pZikKKwkJCXJldHVybiAtRU5PTUVNOworCQlhZGV2LT5nbWMu
bW1odWJfcmFzX2lmLT5ibG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX01NSFVCOworCQlhZGV2LT5n
bWMubW1odWJfcmFzX2lmLT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNU
QUJMRTsKKwkJYWRldi0+Z21jLm1taHViX3Jhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsKKwkJ
c3RyY3B5KGFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPm5hbWUsICJtbWh1YiIpOworCX0KKwltbWh1
Yl9paF9pbmZvLmhlYWQgPSBtbWh1Yl9mc19pbmZvLmhlYWQgPSAqYWRldi0+Z21jLm1taHViX3Jh
c19pZjsKKwlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+Z21jLm1taHViX3Jh
c19pZiwKKwkJCQkgJm1taHViX2ZzX2luZm8sICZtbWh1Yl9paF9pbmZvKTsKKwlpZiAocikKKwkJ
Z290byBmcmVlOworCisJcmV0dXJuIDA7CitmcmVlOgorCWtmcmVlKGFkZXYtPmdtYy51bWNfcmFz
X2lmKTsKKwlrZnJlZShhZGV2LT5nbWMubW1odWJfcmFzX2lmKTsKIAlyZXR1cm4gcjsKIH0KIAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
