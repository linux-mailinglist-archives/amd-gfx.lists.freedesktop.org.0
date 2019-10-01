Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E9C43A2
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 00:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846CD6E8AA;
	Tue,  1 Oct 2019 22:17:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F166E8AA
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 22:17:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2VZZV5kTCL3VkTDx+JsApmvwbW3Qov0V2ij3RsRKETaElC2/UF+sWWBvMHUJxWJf4DRwUpaE2+v/AaK5TXESdPpE9o6FPGafri8CKleAb10oJ6C2j8rKt0AwSmol2GYM2zWBr4MHIhbuN9lW6b/Akz2rfMfUV1GdnYZG1CM26O6/2suNUXb/ryC1oSRB84PRh4H42zvBHKoOIGu3slgav9bRpi8T8I+tHSnZnvflMkWx0VgSms14Yk+F98gPbtgd0gRXQmxtRkY5DUr/WXbdR9kLoSLXhZhJdUIs0DvBgVwqe8ecNfSbotuLEEkOYFHLdzDArz/6/jxSbCddesqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt5ECwiJP1Wgc/bpBw4+TFfKUVlADPmOFE0GZ3U6XOA=;
 b=Ua580fIR0LK5IfK4RO/4oZkml8NBpOrUlptAO+BdbIzJZIn/uJNXwsENpKQvNjjV5006SeSyP9k7zK9m3FiYhlLNfOBNIcgOY3aCSeULaHT4HU/hHTFA/+8Bw6TggEUE/A7LOdpHA3DVfNyKNcO9EonA1U3IAO5ue1x+UJqlZAwZHzHxJDSawAE1ZkI4k9VJuPbmUvx8ZQevb6AYnQ2Py2qniugYH6Bciju3PEuUs33n2qQ83hEi5ff8bUx89zFRq1DlFDWgKRmolZrFhuNcyR8bYpI5qyeULLTbSakaAtHT2fXQiapwKvdTsL6RFQu4NoOsCpDYopiXCgNz/DS5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1545.namprd12.prod.outlook.com (10.172.35.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 22:17:29 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72%3]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 22:17:29 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu/vcn: use amdgpu_ring_test_helper instead of
Thread-Topic: [PATCH 1/2] drm/amdgpu/vcn: use amdgpu_ring_test_helper instead
 of
Thread-Index: AQHVeKYDqfZVSv+wQ0e09mHWIEz3mg==
Date: Tue, 1 Oct 2019 22:17:28 +0000
Message-ID: <20191001221708.20185-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::42) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47d960c0-6165-4c73-cc89-08d746bd2574
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1545:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1545A5C0C6DE3FB994DA2449E59D0@DM5PR12MB1545.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(199004)(189003)(26005)(1076003)(66946007)(66556008)(66476007)(64756008)(478600001)(66446008)(6506007)(386003)(102836004)(86362001)(4326008)(186003)(6486002)(6436002)(5640700003)(50226002)(7736002)(256004)(305945005)(71200400001)(81156014)(71190400001)(81166006)(6116002)(3846002)(8936002)(8676002)(52116002)(6512007)(2906002)(6916009)(99286004)(66066001)(14454004)(2501003)(2616005)(476003)(25786009)(5660300002)(2351001)(36756003)(316002)(486006)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1545;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2Tdy4K/G6iciGwLvNeo5kUJOw/oORD8cr0o7lwip1mxxSn6Men0/Rt30ik1cThYvg8BYswhrawot3EhZVotABHFOAuD4kR2V0BdjqPu5Dw9DROEgMiqTdYvkse6/cvc3pudLF7Eb1LHFGb2hsqfxNUZXme55A+YejDvgO/fOIEo3ara76+5kDagGruHjnrSaTUtezkRvvf0vNfoZXnFKVns11KCR1nRYjMm97Gs9WKYMVypzBXY1JYf3oKI5gpUKoNaFi6p//hEfImCnQGLVGB4RDoOvlZlo1JMDrXHaOC3+wu292NXpbys/6clyewuzLMfm3YNHSNVFWFIyHmgbA+P0Z7FWE6jn4VMy/Ml3bkRN/EOG9t3Ml6xZJ9y4MtpYFSVu4IVjQ9hdRlVTU06imaFxMEd5i1VjNp+O0IKBEM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d960c0-6165-4c73-cc89-08d746bd2574
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 22:17:28.9598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQt2yUMqON4bWsD6TUzP/MoZIr4ZQ/w6ViCrJCXhJsogLBTjprfdSBiEYMt6GvKT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt5ECwiJP1Wgc/bpBw4+TFfKUVlADPmOFE0GZ3U6XOA=;
 b=3BQU3HZFGXC2hi28Et0mrFfjLOQDyTuioHQXCISHTCUMJsgH2/+IP2m4dzcyiWaNP1xdnzWlAEZoUlTl1qNLa7cfMn050aqML+E1L5c/kM4Y6Xa6Z3mWpkKxQxd50vGoSdG3+zciH0LTi4kaex5uT3uUU2WQQ1LoTag/myCc/yE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X3JpbmdfdGVzdF9yaW5nLCBzbyBpdCB3aWxsIGRldGVybWluZSB3aGV0aGVyIHRoZSBy
aW5nIGlzIHJlYWR5CgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+CkNj
OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjJfMC5jIHwgMjEgKysrKysrLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIHwgMTggKysrKysrLS0tLS0tLS0tLS0tCiAz
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCmluZGV4IDkzYjM1MDBlNTIyYi4uYjRmODRhODIw
YTQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMKQEAgLTIwMiw3ICsyMDIs
NiBAQCBzdGF0aWMgaW50IHZjbl92MV8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQogCiAJZm9yIChp
ID0gMDsgaSA8IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyArK2kpIHsKIAkJcmluZyA9ICZhZGV2
LT52Y24uaW5zdC0+cmluZ19lbmNbaV07Ci0JCXJpbmctPnNjaGVkLnJlYWR5ID0gdHJ1ZTsKIAkJ
ciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVscGVyKHJpbmcpOwogCQlpZiAocikKIAkJCWdvdG8gZG9u
ZTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCmluZGV4IDQ2MjhmZDEwYTllYy4u
MzhmNzg3YTU2MGNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25f
djJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKQEAgLTI0
NywzMCArMjQ3LDIxIEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBfaHdfaW5pdCh2b2lkICpoYW5kbGUp
CiAJYWRldi0+bmJpby5mdW5jcy0+dmNuX2Rvb3JiZWxsX3JhbmdlKGFkZXYsIHJpbmctPnVzZV9k
b29yYmVsbCwKIAkJCQkJICAgICByaW5nLT5kb29yYmVsbF9pbmRleCwgMCk7CiAKLQlyaW5nLT5z
Y2hlZC5yZWFkeSA9IHRydWU7Ci0JciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsKLQlp
ZiAocikgewotCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOworCXIgPSBhbWRncHVfcmluZ190
ZXN0X2hlbHBlcihyaW5nKTsKKwlpZiAocikKIAkJZ290byBkb25lOwotCX0KIAogCWZvciAoaSA9
IDA7IGkgPCBhZGV2LT52Y24ubnVtX2VuY19yaW5nczsgKytpKSB7CiAJCXJpbmcgPSAmYWRldi0+
dmNuLmluc3QtPnJpbmdfZW5jW2ldOwotCQlyaW5nLT5zY2hlZC5yZWFkeSA9IHRydWU7Ci0JCXIg
PSBhbWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7Ci0JCWlmIChyKSB7Ci0JCQlyaW5nLT5zY2hl
ZC5yZWFkeSA9IGZhbHNlOworCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9oZWxwZXIocmluZyk7CisJ
CWlmIChyKQogCQkJZ290byBkb25lOwotCQl9CiAJfQogCiAJcmluZyA9ICZhZGV2LT52Y24uaW5z
dC0+cmluZ19qcGVnOwotCXJpbmctPnNjaGVkLnJlYWR5ID0gdHJ1ZTsKLQlyID0gYW1kZ3B1X3Jp
bmdfdGVzdF9yaW5nKHJpbmcpOwotCWlmIChyKSB7Ci0JCXJpbmctPnNjaGVkLnJlYWR5ID0gZmFs
c2U7CisJciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVscGVyKHJpbmcpOworCWlmIChyKQogCQlnb3Rv
IGRvbmU7Ci0JfQogCiBkb25lOgogCWlmICghcikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25f
djJfNS5jCmluZGV4IGJmODYyNmUxNWIwOS4uY2MxOTQ0NDQzNjNmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml81LmMKQEAgLTI1OCwyOSArMjU4LDIzIEBAIHN0YXRpYyBpbnQgdmNu
X3YyXzVfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJCWFkZXYtPm5iaW8uZnVuY3MtPnZjbl9kb29y
YmVsbF9yYW5nZShhZGV2LCByaW5nLT51c2VfZG9vcmJlbGwsCiAJCQkJCQkgICAgIHJpbmctPmRv
b3JiZWxsX2luZGV4LCBqKTsKIAotCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOwot
CQlpZiAocikgewotCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKKwkJciA9IGFtZGdwdV9y
aW5nX3Rlc3RfaGVscGVyKHJpbmcpOworCQlpZiAocikKIAkJCWdvdG8gZG9uZTsKLQkJfQogCiAJ
CWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX2VuY19yaW5nczsgKytpKSB7CiAJCQlyaW5n
ID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZW5jW2ldOwogCQkJcmluZy0+c2NoZWQucmVhZHkg
PSBmYWxzZTsKIAkJCWNvbnRpbnVlOwotCQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5n
KTsKLQkJCWlmIChyKSB7Ci0JCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKKwkJCXIgPSBh
bWRncHVfcmluZ190ZXN0X2hlbHBlcihyaW5nKTsKKwkJCWlmIChyKQogCQkJCWdvdG8gZG9uZTsK
LQkJCX0KIAkJfQogCiAJCXJpbmcgPSAmYWRldi0+dmNuLmluc3Rbal0ucmluZ19qcGVnOwotCQly
ID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOwotCQlpZiAocikgewotCQkJcmluZy0+c2No
ZWQucmVhZHkgPSBmYWxzZTsKKwkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVscGVyKHJpbmcpOwor
CQlpZiAocikKIAkJCWdvdG8gZG9uZTsKLQkJfQogCX0KIGRvbmU6CiAJaWYgKCFyKQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
