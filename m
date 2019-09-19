Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75010B73CF
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11FF6F94D;
	Thu, 19 Sep 2019 07:13:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB896F94D
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUZXY2HlDjUevIzficGWNhsN70bktrM27GuZNR7hk6AMgvEsh4MUp0THfS3d33CIkrnjDbn2giqoPEZ98WEhzFfS4KgxzCsMrupJhRJt2sCzbHHFtteV53vBLUN2cUxqg4h9gRTZ05JFnWV8/Gf2fbagxoxX9kerYWe7kSlbXyJabikpfNxwXYBCE0g5vM0bst35Ei0CgB0TM8POCidAkpNMoQ8Fbf1BPCWZZD78kmYzNDBX+og9vPxMbSjgBXXVXionlKUBorZ/kuUcXRiHA6/TA4GMmWbHxOdZTACC0NhuIalZPZT/cBCtPrhN3V39MbLCLuS936LpkQBLIHO3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTcq+Dgc4KqgG2Zdj6NkoVC+cNjNsv4jOb0FPmSDuQw=;
 b=doW8QGv8J5KXWJnuHAQJYFmUYvekFRJeTpMuUb9qHfP9lCMIKcmDF1Y2zT91T0pGEC9W8Xgr5rwpmjIEaJ54OyAGrEJbAfHM7ccH/P2EyOL5zsECCBu4sHMpePRioI4c6XuPJ41pwme0sVGq35byisM1CPYKSL1hiUpv2qAN2nhGp7NamtPN3iCvGbxoAFmqcwa74Y4a380DeNng/BMVDjUmO5Q4mLvJCh7naFexM6iQRwuubLMxibZQR9mnUH8rMvhu7gC0zDSElpR+4+2Tb+Z8lR09Wdp4uRvBKNAXc4igCIlW8YxaKaCHcFnsJEZxhEgESA0bIQQxiaY5AlIukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:13:00 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:13:00 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 14/21] drm/amdgpu: remove ih_info parameter of
 gfx_ras_late_init
Thread-Topic: [PATCH 14/21] drm/amdgpu: remove ih_info parameter of
 gfx_ras_late_init
Thread-Index: AQHVbrmrT0xYgo4f9k6s62t/loqPBQ==
Date: Thu, 19 Sep 2019 07:13:00 +0000
Message-ID: <20190919071115.16552-15-tao.zhou1@amd.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:203:72::32) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c06a0180-bd7a-49e2-8aa4-08d73cd0cdf4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28943C1A161BB5F936877119B0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pzKmMb1kVP/5kiphe5wqmgmdE6/vSjH1QP+3UJmkm7eKFaY4bwpou3u+UFCgg8s0bEgA18M85k567DKXwQuEPz8FyuHqEVWVyxJtFzvzXOD+9FCGnK4go0vkvaF8FqgSRN0Q/ngj7qCa0U16va78r3kDy7Bi7n/WW0DhDJ1C2l91oaKOOPj6d598jZU/WF4IzP1ulutu/7pwFDscgAw7Zlsja5bx30zoMZTEdXxg3lRcGRS1If7RsOT110uRiZQNRYHv7qvQTT47XLUOuF94XUF1bsGZHa734v3Ffd6lZitq99rTK36+n6zJdACLUqtat8CRop3pmCHYoCzcDWsAfuGgRAhaaLRpik8Ow2MeONyuXAv3VjhrUDneXFvKbdG2Dm+aK0qaTeEHCQvOZ1QxtLmcwXgzIyQWr5fnCtApgcc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06a0180-bd7a-49e2-8aa4-08d73cd0cdf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:13:00.4852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vp87oozr8io4hOgyHzqbXFfV6+srxCnUsGicu+mVnaHJ8StTiXDgmx77YP/BSrAr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTcq+Dgc4KqgG2Zdj6NkoVC+cNjNsv4jOb0FPmSDuQw=;
 b=hH5gVTrO7FCIdHSyFQke6Kn75D4hhpw3Mjkkh0mZ53+LxSKxjhYv20Aw8A91l1Jj7O1Zq6NTombZE5TbKEOH5Cv88uPcfg1JqTbnaDwFFfRYm++EDQ0RPzy0DYRkQygf+c0c8fb0bAvlFdcC1+l4oVQNv8/2aKmsjD8Dw/J8CpQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Z2Z4X3Jhc19sYXRlX2luaXQgY2FuIGdldCB0aGUgaW5mbyBieSBpdHNlbGYKClNpZ25lZC1vZmYt
Ynk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2Z4LmMgfCAxNiArKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggfCAgMyArLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OV8wLmMgICB8ICA1ICstLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dmeC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dmeC5jCmluZGV4IDRmNjM1ZjI4ZWIzNC4uODEwZTg1YzQ1MDAxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCkBAIC01NzEsMTggKzU3MSwxNiBAQCB2b2lkIGFtZGdw
dV9nZnhfb2ZmX2N0cmwoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxlKQog
CW11dGV4X3VubG9jaygmYWRldi0+Z2Z4LmdmeF9vZmZfbXV0ZXgpOwogfQogCi1pbnQgYW1kZ3B1
X2dmeF9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJICAgICB2
b2lkICpyYXNfaWhfaW5mbykKK2ludCBhbWRncHVfZ2Z4X3Jhc19sYXRlX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJaW50IHI7Ci0Jc3RydWN0IHJhc19paF9pZiAqaWhfaW5m
byA9IChzdHJ1Y3QgcmFzX2loX2lmICopcmFzX2loX2luZm87CiAJc3RydWN0IHJhc19mc19pZiBm
c19pbmZvID0gewogCQkuc3lzZnNfbmFtZSA9ICJnZnhfZXJyX2NvdW50IiwKIAkJLmRlYnVnZnNf
bmFtZSA9ICJnZnhfZXJyX2luamVjdCIsCiAJfTsKLQotCWlmICghaWhfaW5mbykKLQkJcmV0dXJu
IC1FSU5WQUw7CisJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0geworCQkuY2IgPSBhbWRncHVf
Z2Z4X3Byb2Nlc3NfcmFzX2RhdGFfY2IsCisJfTsKIAogCWlmICghYWRldi0+Z2Z4LnJhc19pZikg
ewogCQlhZGV2LT5nZngucmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IHJhc19jb21tb25f
aWYpLCBHRlBfS0VSTkVMKTsKQEAgLTU5MywxMCArNTkxLDEwIEBAIGludCBhbWRncHVfZ2Z4X3Jh
c19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCWFkZXYtPmdmeC5yYXNf
aWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7CiAJCXN0cmNweShhZGV2LT5nZngucmFzX2lmLT5uYW1l
LCAiZ2Z4Iik7CiAJfQotCWZzX2luZm8uaGVhZCA9IGloX2luZm8tPmhlYWQgPSAqYWRldi0+Z2Z4
LnJhc19pZjsKKwlmc19pbmZvLmhlYWQgPSBpaF9pbmZvLmhlYWQgPSAqYWRldi0+Z2Z4LnJhc19p
ZjsKIAogCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5nZngucmFzX2lmLAot
CQkJCSAmZnNfaW5mbywgaWhfaW5mbyk7CisJCQkJICZmc19pbmZvLCAmaWhfaW5mbyk7CiAJaWYg
KHIpCiAJCWdvdG8gZnJlZTsKIApAQCAtNjEyLDcgKzYxMCw3IEBAIGludCBhbWRncHVfZ2Z4X3Jh
c19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAlyZXR1cm4gMDsKIGxh
dGVfZmluaToKLQlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCBhZGV2LT5nZngucmFzX2lmLCBp
aF9pbmZvKTsKKwlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCBhZGV2LT5nZngucmFzX2lmLCAm
aWhfaW5mbyk7CiBmcmVlOgogCWtmcmVlKGFkZXYtPmdmeC5yYXNfaWYpOwogCWFkZXYtPmdmeC5y
YXNfaWYgPSBOVUxMOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dmeC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oCmluZGV4
IDhmMmQxMzdmNGQyMC4uODVjNmI4NzRjMzBjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dmeC5oCkBAIC0zODMsOCArMzgzLDcgQEAgdm9pZCBhbWRncHVfZ2Z4X2JpdF90b19t
ZV9xdWV1ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGJpdCwKIGJvb2wgYW1kZ3B1
X2dmeF9pc19tZV9xdWV1ZV9lbmFibGVkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQg
bWUsCiAJCQkJICAgIGludCBwaXBlLCBpbnQgcXVldWUpOwogdm9pZCBhbWRncHVfZ2Z4X29mZl9j
dHJsKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIGVuYWJsZSk7Ci1pbnQgYW1kZ3B1
X2dmeF9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJICAgICB2
b2lkICpyYXNfaWhfaW5mbyk7CitpbnQgYW1kZ3B1X2dmeF9yYXNfbGF0ZV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsKIGludCBhbWRncHVfZ2Z4X3Byb2Nlc3NfcmFzX2RhdGFfY2Io
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXZvaWQgKmVycl9kYXRhLAogCQlzdHJ1Y3Qg
YW1kZ3B1X2l2X2VudHJ5ICplbnRyeSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
YwppbmRleCBhYmRiZDY5Mzk0ZTYuLjg3M2NiNDZkMzQzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jCkBAIC00Mzc2LDEyICs0Mzc2LDkgQEAgc3RhdGljIGludCBnZnhfdjlf
MF9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVf
aW5pdCh2b2lkICpoYW5kbGUpCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Ci0Jc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0g
ewotCQkuY2IgPSBhbWRncHVfZ2Z4X3Byb2Nlc3NfcmFzX2RhdGFfY2IsCi0JfTsKIAlpbnQgcjsK
IAotCXIgPSBhbWRncHVfZ2Z4X3Jhc19sYXRlX2luaXQoYWRldiwgJmloX2luZm8pOworCXIgPSBh
bWRncHVfZ2Z4X3Jhc19sYXRlX2luaXQoYWRldik7CiAJaWYgKHIpCiAJCXJldHVybiByOwogCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
