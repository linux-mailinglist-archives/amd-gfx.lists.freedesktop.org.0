Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55366AE406
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 08:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8624F6E067;
	Tue, 10 Sep 2019 06:52:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770058.outbound.protection.outlook.com [40.107.77.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB066E067
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 06:52:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGgRqNvodaXrz1oIHV7BsPR2FEOyjoTOHOZm19D+EwXuEwxIHCiAv6WhdesLqCYFASTZyfVsZ3Y046o1GFMb2FDPReuhmrETuKc2xDk0KqZrNr2qV7BwIEs20+utWxkSGcEsvPMCD0fw2T8HWkRw7BMpqGdyA0UC+VorZSBn9kBaV+59dLkdwmx/Sz9VWlez9WFndwdCBXQ1eXgAYPLd+YQodRotJNAFPHCAYGVT/QuiDlCqRfbpumIArJ29Eo83Pp/c9ACxsuVd5yFkrZw+Npv7Dr1GaV14kcdpFnNS+Tk8EQhAKGoeKv06QV6aKNGXF1goCmw5r/m6AkFa04zxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi52rGDAFxRcFfXpQCdsKuzkargm530mfRsUGjIxV9w=;
 b=WDq8LzrYPWFDjfNtvGtPO6/lnvEFZEvgGh3htXE7whzXm8wihGdnfdiLcey4hcq+R7SfbIIwSNjUpyi+/kqpMRYQCNwPSo8z1QV9+kCBLv7nPNRVsFk+Ms2DDsh/e5sKc8yt+Gl0rJ7PXoTZ4p8ZcC3Nisgf2QoUliMp/Ine5Zh0tOo2hNEJCQZ9qOJgKe7oDCKjkxUDsw7l99iOzHpK62CjkErToMssmnhitKQiawK+2k/9bSdiGXNIZylBiBjDGBPbHQuYwTwChqbaFC1Rmr+95DO9qsk4DTVB17UwEp0C+F1XLOrFvRsmdZchrQE2uIDqa5prf6z/N9QBpgJxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3639.namprd12.prod.outlook.com (20.178.54.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 06:52:49 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 06:52:49 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 3/3] drm/amdgpu: rename umc ras_init to err_cnt_init
Thread-Topic: [PATCH 3/3] drm/amdgpu: rename umc ras_init to err_cnt_init
Thread-Index: AQHVZ6FfO1mA0buMZkqDsbcyQ+2UvackeU4Q
Date: Tue, 10 Sep 2019 06:52:48 +0000
Message-ID: <BYAPR12MB2806467B7225B0E9D068DDD1F1B60@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190910063103.14099-1-tao.zhou1@amd.com>
 <20190910063103.14099-3-tao.zhou1@amd.com>
In-Reply-To: <20190910063103.14099-3-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c80cb8c2-11c5-4ec5-9d95-08d735bb7e5c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3639; 
x-ms-traffictypediagnostic: BYAPR12MB3639:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB363905E51E18554A335ADA73F1B60@BYAPR12MB3639.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(189003)(199004)(13464003)(53936002)(8676002)(81166006)(9686003)(7736002)(81156014)(3846002)(52536014)(6116002)(6636002)(102836004)(256004)(64756008)(66446008)(305945005)(66476007)(66946007)(11346002)(446003)(2906002)(66066001)(476003)(86362001)(55016002)(71190400001)(71200400001)(74316002)(6246003)(8936002)(33656002)(316002)(229853002)(110136005)(76116006)(486006)(186003)(14454004)(5660300002)(66556008)(478600001)(25786009)(6436002)(26005)(53546011)(2501003)(76176011)(99286004)(7696005)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3639;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yv9Pm+hB494CXXi2p8+JIEFrpbDXQ5N2TX0gHlkZ+6hWIo5u0wsbQHOu4ccMNLeVCrNrWLf+CloMcefljZ0/cJoE7kQZT7XKIbP2dLC9VNspVcjxhCl5jh0O83I/3CWGb9dHYCaxECMMR9drpBDCpJQIdCkoEb/zY7EdUU4Ntpu0bdxW+KiRMpRT+Lwlh17CuVvJzmnD4/hvveDxKe5hfpoq8VbJdvRWcMgjxpUio0MSDfUiF0XU4MV+OWWdzjpLah0qFc//RySNX8f0cXDfD2I9iQ4Z6oKDol1srTKtc8wkmg/zsip0M1IfRV245f2nDL8Gn8KzarobtZ25cmC4ZJYlbu+Kz1e4SFOBrPHTpErP7NY5u0sUw2goa0FTZ6YZ0YHa6jWfu7Bwns/E/GkB4n10zRwa6rh2l5RtFRqIjIQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80cb8c2-11c5-4ec5-9d95-08d735bb7e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 06:52:49.0010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xqpAX7czEuV6Urjqh5Iqth9cHHrf45wxBGnb1nrBFLvJPSFfR0wgbLEKId3uF/dzJujySaqdUBBoOzV1qwbJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3639
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi52rGDAFxRcFfXpQCdsKuzkargm530mfRsUGjIxV9w=;
 b=1PA9a4wuqla+/MB+jh6g6cqRpByjSWWfbY7KbYBzWLoc9wb0SEU3DH28sW+F7qcOz3O5U3aF8zzP6pZR632s+BMBELGzVDYR6h9pQKBpjLg0iKn7F/BLp9CdPv5ujx5YrZ3M1VWEBYKdH/Ufwtq4ltaM/XtuWIXoVrLq6jtay60=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzOiBSZXZpZXdlZC1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+
CgpSZWdhcmRzLApHdWNodW4KCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFpob3Ux
LCBUYW8gPFRhby5aaG91MUBhbWQuY29tPiAKU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDEwLCAy
MDE5IDI6MzEgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3
a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBh
bWQuY29tPgpDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+ClN1YmplY3Q6IFtQQVRD
SCAzLzNdIGRybS9hbWRncHU6IHJlbmFtZSB1bWMgcmFzX2luaXQgdG8gZXJyX2NudF9pbml0Cgp0
aGlzIGludGVyZmFjZSBpcyByZWxhdGVkIHRvIHNwZWNpZmljIHZlcnNpb24gb2YgdW1jLCBkaXN0
aW5ndWlzaCBpdCBmcm9tIHJhc19sYXRlX2luaXQKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0
YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dW1jLmMgfCA0ICsrLS0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaCB8
IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8IDggKysrKy0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYwppbmRleCA1NjgzYzUxNzEwYWEuLmM1
ZDhiMDhhZjczMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3VtYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYwpAQCAt
NjMsOCArNjMsOCBAQCBpbnQgYW1kZ3B1X3VtY19yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCB2b2lkICpyYXNfaWhfaW5mbykKIAl9CiAKIAkvKiByYXMgaW5pdCBvZiBz
cGVjaWZpYyB1bWMgdmVyc2lvbiAqLwotCWlmIChhZGV2LT51bWMuZnVuY3MgJiYgYWRldi0+dW1j
LmZ1bmNzLT5yYXNfaW5pdCkKLQkJYWRldi0+dW1jLmZ1bmNzLT5yYXNfaW5pdChhZGV2KTsKKwlp
ZiAoYWRldi0+dW1jLmZ1bmNzICYmIGFkZXYtPnVtYy5mdW5jcy0+ZXJyX2NudF9pbml0KQorCQlh
ZGV2LT51bWMuZnVuY3MtPmVycl9jbnRfaW5pdChhZGV2KTsKIAogCXJldHVybiAwOwogCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKaW5kZXggNmYyMmM5NzA0NTU1Li4zZWMz
NmQ5ZTAxMmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91
bWMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKQEAgLTU0
LDcgKzU0LDcgQEAKIAlhZGV2LT51bWMuZnVuY3MtPmRpc2FibGVfdW1jX2luZGV4X21vZGUoYWRl
dik7CiAKIHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHsKLQl2b2lkICgqcmFzX2luaXQpKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwl2b2lkICgqZXJyX2NudF9pbml0KShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldik7CiAJaW50ICgqcmFzX2xhdGVfaW5pdCkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHZvaWQgKnJhc19paF9pbmZvKTsKIAl2b2lkICgqcXVlcnlfcmFzX2Vycm9y
X2NvdW50KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkJdm9pZCAqcmFzX2Vycm9y
X3N0YXR1cyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZf
MS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwppbmRleCA0Y2RiNWMw
NGNkMTcuLjFjMGRhMzJjMTU2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdW1jX3Y2XzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5j
CkBAIC0yMzQsNyArMjM0LDcgQEAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlfcmFzX2Vycm9y
X2FkZHJlc3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJYW1kZ3B1X3VtY19mb3JfZWFj
aF9jaGFubmVsKHVtY192Nl8xX3F1ZXJ5X2Vycm9yX2FkZHJlc3MpOwogfQogCi1zdGF0aWMgdm9p
ZCB1bWNfdjZfMV9yYXNfaW5pdF9wZXJfY2hhbm5lbChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKK3N0YXRpYyB2b2lkIHVtY192Nl8xX2Vycl9jbnRfaW5pdF9wZXJfY2hhbm5lbChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAKKyphZGV2LAogCQkJCQkgc3RydWN0IHJhc19lcnJfZGF0YSAqZXJyX2Rh
dGEsCiAJCQkJCSB1aW50MzJfdCB1bWNfcmVnX29mZnNldCwgdWludDMyX3QgY2hhbm5lbF9pbmRl
eCkgIHsgQEAgLTI2NCwxNSArMjY0LDE1IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3Jhc19pbml0
X3Blcl9jaGFubmVsKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCVdSRUczMihlY2NfZXJy
X2NudF9hZGRyICsgdW1jX3JlZ19vZmZzZXQsIFVNQ19WNl8xX0NFX0NOVF9JTklUKTsgIH0KIAot
c3RhdGljIHZvaWQgdW1jX3Y2XzFfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CitzdGF0aWMgdm9pZCB1bWNfdjZfMV9lcnJfY250X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiB7CiAJdm9pZCAqcmFzX2Vycm9yX3N0YXR1cyA9IE5VTEw7CiAKLQlhbWRncHVfdW1j
X2Zvcl9lYWNoX2NoYW5uZWwodW1jX3Y2XzFfcmFzX2luaXRfcGVyX2NoYW5uZWwpOworCWFtZGdw
dV91bWNfZm9yX2VhY2hfY2hhbm5lbCh1bWNfdjZfMV9lcnJfY250X2luaXRfcGVyX2NoYW5uZWwp
OwogfQogCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcyB1bWNfdjZfMV9mdW5jcyA9IHsK
LQkucmFzX2luaXQgPSB1bWNfdjZfMV9yYXNfaW5pdCwKKwkuZXJyX2NudF9pbml0ID0gdW1jX3Y2
XzFfZXJyX2NudF9pbml0LAogCS5yYXNfbGF0ZV9pbml0ID0gYW1kZ3B1X3VtY19yYXNfbGF0ZV9p
bml0LAogCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSB1bWNfdjZfMV9xdWVyeV9yYXNfZXJyb3Jf
Y291bnQsCiAJLnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzID0gdW1jX3Y2XzFfcXVlcnlfcmFzX2Vy
cm9yX2FkZHJlc3MsCi0tCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
