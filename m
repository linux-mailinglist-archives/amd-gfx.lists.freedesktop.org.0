Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA7A0573
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 16:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B446289D30;
	Wed, 28 Aug 2019 14:59:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373A189D30
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 14:59:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGXncRLE86FqL8DHVmBZWFiGXwc/1dAKgrqvlYRlDdc7tSiKI4fmrwWrIMNIdK9g+E+7ufMwdEdgJ6c0Oge7Qv7Ow+msETQ0HzttO+Tlvk+22htk1nmTv1lXN8/fdfBHQWKk1mkPNCyXXytZt3W8jSk941bFJwztlhV7ncNHVKdkXsVZz+k5XR1lXqporECglPQr6n4/AHBBuAg1NUnhdu7b0di6Y6GO6xEjVa1HtgLUuQcbLvLxzyY2dJqbDFdsz119P0ejwapWFygAtzWtkj+/x5F8pbtYEQjimOsUwKewD14hQyN+fHmkpkH6pl1hpdFf6vc7K7XciUAmwChazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBex+D/cv61yFZ2bOBILJhHUgCSCUA3A7ffCSDb4LZo=;
 b=VJUwfiLxkm0K7Nk0HJMrIbuPKasHawIWhY+SctnTNL1M7m4Hi5DzEaEntZmPwjL0waTU5Dl8qWtLzer4EX7ImFX8EhBbWzBrcr+TB8OrWEKXSdMucNK9QKQjSsNTLxmraqWJpr1GA6V1VUDPKb3n7+plzPYAzz32LOVZZElkD2l0skR4fR4tJjmndT1QvpTzj42nqfOi+jUQyoV8O8PDgR9OdeSPALNOlwVneiqAL94vDjYqi8xXWqhgpqZznoGOge8+h64BNhnb2tmDQ56qJTJdfKEVP8z/2j/pHJnGKjk5p7UYwxqtoPwZmKHKUh7+oMh1ucbnlXHIJvMrMMhDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (52.132.141.147) by
 DM5PR12MB1337.namprd12.prod.outlook.com (10.168.234.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 14:59:18 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::1cf2:68f9:c188:21a5]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::1cf2:68f9:c188:21a5%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 14:59:18 +0000
From: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix gfx ib test failed in sriov
Thread-Topic: [PATCH] drm/amdgpu: fix gfx ib test failed in sriov
Thread-Index: AQHVXbEqiPRfrJ86e0uctGW75vn9cg==
Date: Wed, 28 Aug 2019 14:59:18 +0000
Message-ID: <1567004342-10726-1-git-send-email-JinhuiEric.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fac98ff-6497-4c9a-818b-08d72bc84cfb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1337; 
x-ms-traffictypediagnostic: DM5PR12MB1337:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB13374B9E0DC189BD8CAD74B182A30@DM5PR12MB1337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:159;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(199004)(189003)(5640700003)(52116002)(186003)(305945005)(486006)(2616005)(6916009)(8936002)(26005)(2501003)(256004)(2906002)(8676002)(25786009)(99286004)(81156014)(102836004)(476003)(6506007)(386003)(50226002)(7736002)(4326008)(6486002)(6436002)(6512007)(53936002)(81166006)(478600001)(2351001)(71190400001)(71200400001)(6116002)(86362001)(3846002)(66446008)(64756008)(66556008)(66946007)(66066001)(66476007)(36756003)(5660300002)(14454004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1337;
 H:DM5PR12MB2504.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ih/Y1shwvN00RmAf6ibrUvKNi7hZpfb4DQGVDd3QEyHYqJy9MrsKr40dO3rSNm5pXYlC77ac8LsjtkcS1aCJoeuqTt4UNWdg0zA9pc3FJtJ3ZTYTqUUvfZRhhoH7nZamVv6zxqGX8sUQpuu9xKTAUEg4nMT0IfhlZgMguWRmFwhvf4yOIHupGWyhvo1xHFMQZKcajHoMLCJ7OH9LBpQdau7M52w6cBUFBiSbcJhIvKa4hxYiDfLTNB6iQB0ZsSBYOvuXXivdxQsZH26fH6Vatkj8Ll73rcnAAfV3N4Ddvsmxwet6umDiQCkgCA9bZ6uU9p8clIVv/zRoRDXUZlBzZ4qhhBRvGNJx4kSxToesxtX6D+e55e/QZoGJXkvnGqR43WJSnstyNNEcgAYUynGb4ozvyaogryFF6kKlpYjPk3o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fac98ff-6497-4c9a-818b-08d72bc84cfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 14:59:18.2578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dktHaN3QRXkjLYvCTOYa2N+7waJwNMiF4AMT9bKIjxaFgmbj0VVZ/QLbwOl2crP9u2MmtO/NxDFRyKnFUkNh0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1337
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBex+D/cv61yFZ2bOBILJhHUgCSCUA3A7ffCSDb4LZo=;
 b=gKrNO2Lv5enoUpgN5c5zSalCQGKrYlFpp2SIoehVguczKNJIc4O/LchG8pBKE9rvIQEtBNfzBq9Ax0qsvg0/91s3/WLeA6CymC2fs833Io1YnssMstCoAqBwhyIIWV0fM7K3nUzh++3ODt/PbiXMjxJOo09gJAkjnp0u1NaTPzQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JinHuiEric.Huang@amd.com; 
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
Cc: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQgcGFydGlhbGx5IHJldmVydHMgdGhlIHJlZ3Jlc3Npb24gb2YKCmNvbW1pdCBlNGE2N2U2Y2Yx
NGMyNTg2MTlmCigiZHJtL2FtZGdwdS9wc3A6IG1vdmUgVE1SIHRvIGNwdSBpbnZpc2libGUgdnJh
bSByZWdpb24iKQoKd2hpY2ggY2F1c2VzIGdmeCBpYiB0ZXN0IGZhaWxlZCB3aGVuIGRyaXZlciBs
b2FkaW5nCmluIHNyaW92IHN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEVyaWMgSHVhbmcgPEppbmh1
aUVyaWMuSHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMgfCAxNiArKysrKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmlu
ZGV4IDlmN2NjNWIuLjlmOTFjZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmMKQEAgLTI2MSw5ICsyNjEsMTQgQEAgc3RhdGljIGludCBwc3BfdG1yX2luaXQoc3RydWN0
IHBzcF9jb250ZXh0ICpwc3ApCiAJCX0KIAl9CiAKLQlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tl
cm5lbChwc3AtPmFkZXYsIHRtcl9zaXplLCBQU1BfVE1SX1NJWkUsCi0JCQkJICAgICAgQU1ER1BV
X0dFTV9ET01BSU5fVlJBTSwKLQkJCQkgICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19h
ZGRyLCBOVUxMKTsKKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKHBzcC0+YWRldikpCisJCXJldCA9IGFt
ZGdwdV9ib19jcmVhdGVfa2VybmVsKHBzcC0+YWRldiwgdG1yX3NpemUsIFBTUF9UTVJfU0laRSwK
KwkJCSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCisJCQkgICAgICAmcHNwLT50bXJfYm8s
ICZwc3AtPnRtcl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsKKwllbHNlCisJCXJldCA9IGFtZGdw
dV9ib19jcmVhdGVfa2VybmVsKHBzcC0+YWRldiwgdG1yX3NpemUsIFBTUF9UTVJfU0laRSwKKwkJ
CSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCisJCQkgICAgICAmcHNwLT50bXJfYm8sICZw
c3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKIAogCXJldHVybiByZXQ7CiB9CkBAIC0xMjE2LDcgKzEy
MjEsMTAgQEAgc3RhdGljIGludCBwc3BfaHdfZmluaSh2b2lkICpoYW5kbGUpCiAKIAlwc3Bfcmlu
Z19kZXN0cm95KHBzcCwgUFNQX1JJTkdfVFlQRV9fS00pOwogCi0JYW1kZ3B1X2JvX2ZyZWVfa2Vy
bmVsKCZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOworCWlmIChhbWRncHVf
c3Jpb3ZfdmYoYWRldikpCisJCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT50bXJfYm8sICZw
c3AtPnRtcl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsKKwllbHNlCisJCWFtZGdwdV9ib19mcmVl
X2tlcm5lbCgmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKIAlhbWRncHVf
Ym9fZnJlZV9rZXJuZWwoJnBzcC0+ZndfcHJpX2JvLAogCQkJICAgICAgJnBzcC0+ZndfcHJpX21j
X2FkZHIsICZwc3AtPmZ3X3ByaV9idWYpOwogCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT5m
ZW5jZV9idWZfYm8sCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKaW5kZXgg
YmMwOTQ3Zi4uYjczZDRhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
aApAQCAtMTcxLDYgKzE3MSw3IEBAIHN0cnVjdCBwc3BfY29udGV4dAogCS8qIHRtciBidWZmZXIg
Ki8KIAlzdHJ1Y3QgYW1kZ3B1X2JvCQkqdG1yX2JvOwogCXVpbnQ2NF90CQkJdG1yX21jX2FkZHI7
CisJdm9pZAkJCQkqdG1yX2J1ZjsKIAogCS8qIGFzZCBmaXJtd2FyZSBhbmQgYnVmZmVyICovCiAJ
Y29uc3Qgc3RydWN0IGZpcm13YXJlCQkqYXNkX2Z3OwotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
