Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23433A7348
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 21:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA898970E;
	Tue,  3 Sep 2019 19:13:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700086.outbound.protection.outlook.com [40.107.70.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADC38970E
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 19:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNwY9o4l3+uKScR9OprH3hOoKEVmM4XigR5GzwP6SC9GR6O4VrMY140kTSV5jtK3hseNNTnUeH5c0cdzdDtDFTSuvRYOb8dGOCwYctb67yS15rLk05sAvVpXH4tKjOK0kdne6tZywGtVl7ZWbKfcaYGNeIchkDTC3Br3HRfMW1ztdUjj4SL/kNbu1E8LUFOJ52WWSWIEWXrP72BnQwUDSjLa/lsW/rR7AnOIdCkdo3y65XkwGC5owku3Is1REe52nm7QKO94rsOBEJvOpIokJ9O3LyF61+ZMh+XhVjZ2rlebDdlmLmpUU594/p63nsY6vyT+6mVsMuvl6BFIUJyWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYsES/wbjxwVYXFzu2xgYYIYq3BlDlxxSiTP/IKMd9Y=;
 b=XvVraU288x/D8gKh7PInVc0AldCwbmoi9xEwn+Za6/FktJRKiJUm1+7YhtxXmWjWy/qwprkOvhLr4/k4ONN3XDtcXBkoi7vo0hhAv03ACCeb+NuEHOYkIQ1oY30Hz7XAMJoITLlWCGSXeGc6j2KLzOVpvALdS3e7/FumzCfpNKVZgFLCHw6URAG/jswgny/WlkEAwlg3/pHDH1JFchITXxuBYMtiMKnqEY9h9bm5/kYpLXIa8qNxhNCwVKdwRvpw7VPcnFGLsLtDEh6tRv1Z8oIwpGIi6k3qAJCDIYXny5cZH7OChqZuvn8rk8RaIXTVCKeoZky1pHfYG+wIYqncBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1673.namprd12.prod.outlook.com (10.172.39.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Tue, 3 Sep 2019 19:13:07 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 19:13:07 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 3/3] dmr/amdgpu: Add system auto reboot to RAS.
Thread-Topic: [PATCH v4 3/3] dmr/amdgpu: Add system auto reboot to RAS.
Thread-Index: AQHVYnbXTvgiS6zWrU6We8VQV0q2j6caUjHg
Date: Tue, 3 Sep 2019 19:13:07 +0000
Message-ID: <DM5PR12MB1418485DC3790CD8F7A12D47FCB90@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1567529044-5918-1-git-send-email-andrey.grodzovsky@amd.com>
 <1567529044-5918-3-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567529044-5918-3-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daf53dc3-1b84-4f75-16d8-08d730a2c0ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1673; 
x-ms-traffictypediagnostic: DM5PR12MB1673:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB16735BDA69C2E913D35A9CCCFCB90@DM5PR12MB1673.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(189003)(199004)(13464003)(446003)(478600001)(11346002)(186003)(26005)(81166006)(256004)(14444005)(8676002)(81156014)(74316002)(53546011)(6506007)(99286004)(66066001)(52536014)(476003)(66556008)(66476007)(66946007)(5660300002)(7696005)(486006)(102836004)(14454004)(2906002)(7736002)(55016002)(6116002)(316002)(229853002)(33656002)(6306002)(53936002)(54906003)(966005)(76176011)(8936002)(4326008)(9686003)(71190400001)(71200400001)(6436002)(305945005)(66446008)(25786009)(76116006)(2501003)(86362001)(110136005)(3846002)(64756008)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1673;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L3cJpmG1YYdoiXPwSxWFFxaGUpnGM5vdAR92ujvYGym63N7H5cuDVs6vpMby9PwYu0athFZNyINuBLXsNgnZjds9tlhFf4I7GZiJeJg5agDKQsiaklvFzKB7SPhDXkA4RNhcqk6F9l1h41xVKcUWe3FDfBhC1p+bDDul6bNBgYmrdfxVyrgswebCkBGP7s7kyiXNL0dj0MjKBNwAhgGlJ0LyQSMk9ghlLrGObfMgRxqM9Ia3axw2WJZ0gpsrCF6xtJLeNjC+IZrEwer835MV+b7v93HAdN9UUUz58djhUpiVuQwD0ZKSBNCC3VOjKOLnkONwmYZYeEfpq0AGUv0wHi6nQ/IYWpBn7PHbMJ6OlPXFPAFaT397Vyyy6L2ro56wDifXCI1Ze4NOYZO96BS8tBVcBADrCP/u8gK1UhcKln4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf53dc3-1b84-4f75-16d8-08d730a2c0ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 19:13:07.0661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3GCnleUiEh4qXXA2iQqUOfFMZkEi/6TZGbk8VU2weWmdXJFaI1OS6r/4hHsu67mnXgcbhS3mrnBCHuzXMPB0WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYsES/wbjxwVYXFzu2xgYYIYq3BlDlxxSiTP/IKMd9Y=;
 b=gDGgxrORGLclf8A2UpFjBwCm6HHbFTZUG85ueBTVl6hJxCGQ9UzGWCr1o3Yh55oJ+pey6q0l0lsiD9ZPvpkuPza/+sNndArX2C631Nt7js7LJU7u1H+qaECKcMfk8qpoksGYrH5nb8Hsa3eKtS/3iQ2cUAtgo+QHd3hHuWZHrdk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mIEFuZHJleSBHcm9kem92c2t5DQpTZW50OiAyMDE55bm0OeaciDTml6UgMDo0NA0KVG86
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogYWxleGRldWNoZXJAZ21haWwuY29t
OyBja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbTsgWmhvdTEsIFRhbyA8VGFvLlpob3Ux
QGFtZC5jb20+OyBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+
OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENI
IHY0IDMvM10gZG1yL2FtZGdwdTogQWRkIHN5c3RlbSBhdXRvIHJlYm9vdCB0byBSQVMuDQoNCklu
IGNhc2Ugb2YgUkFTIGVycm9yIGFsbG93IHVzZXIgY29uZmlndXJlIGF1dG8gc3lzdGVtIHJlYm9v
dCB0aHJvdWdoIHJhc19jdHJsLg0KVGhpcyBpcyBhbHNvIHBhcnQgb2YgdGhlIHRlbXByb3JheSB3
b3JrIGFyb3VuZCBmb3IgdGhlIFJBUyBoYW5nIHByb2JsZW0uDQoNCnY0OiBVc2UgbGF0ZXN0IGtl
cm5lbCBBUEkgZm9yIGRpc2sgc3luYy4NCg0KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxNCArKysrKysrKysrKysrKw0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyAgICB8ICA5ICsrKysrKysrLQ0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCAgICB8ICAxICsNCiAzIGZpbGVzIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KaW5kZXggYmU1MjMxOC4uNjllMDgyMCAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQpAQCAtNjQsNiArNjQs
OCBAQA0KICNpbmNsdWRlICJhbWRncHVfcmFzLmgiDQogI2luY2x1ZGUgImFtZGdwdV9wbXUuaCIN
CiANCisjaW5jbHVkZSA8bGludXgvc3VzcGVuZC5oPg0KKw0KIE1PRFVMRV9GSVJNV0FSRSgiYW1k
Z3B1L3ZlZ2ExMF9ncHVfaW5mby5iaW4iKTsNCiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdh
MTJfZ3B1X2luZm8uYmluIik7DQogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW5fZ3B1X2lu
Zm8uYmluIik7DQpAQCAtMzc2MCw2ICszNzYyLDE4IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9y
ZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIAlpbnQgaSwgciA9IDA7DQogCWJv
b2wgaW5fcmFzX2ludHIgPSBhbWRncHVfcmFzX2ludHJfdHJpZ2dlcmVkKCk7DQogDQorCS8qDQor
CSAqIEZsdXNoIFJBTSB0byBkaXNrIHNvIHRoYXQgYWZ0ZXIgcmVib290DQorCSAqIHRoZSB1c2Vy
IGNhbiByZWFkIGxvZyBhbmQgc2VlIHdoeSB0aGUgc3lzdGVtIHJlYm9vdGVkLg0KKwkgKi8NCisJ
aWYgKGluX3Jhc19pbnRyICYmIGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCkg
ew0KKw0KKwkJRFJNX1dBUk4oIkVtZXJnZW5jeSByZWJvb3QuIik7DQorDQorCQlrc3lzX3N5bmNf
aGVscGVyKCk7DQorCQllbWVyZ2VuY3lfcmVzdGFydCgpOw0KKwl9DQorDQogCW5lZWRfZnVsbF9y
ZXNldCA9IGpvYl9zaWduYWxlZCA9IGZhbHNlOw0KIAlJTklUX0xJU1RfSEVBRCgmZGV2aWNlX2xp
c3QpOw0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KaW5kZXggMWNj
MzRkZS4uYThlZWNiOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
DQpAQCAtMTU0LDYgKzE1NCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxf
cGFyc2VfZGF0YShzdHJ1Y3QgZmlsZSAqZiwNCiAJCW9wID0gMTsNCiAJZWxzZSBpZiAoc3NjYW5m
KHN0ciwgImluamVjdCAlMzJzICU4cyIsIGJsb2NrX25hbWUsIGVycikgPT0gMikNCiAJCW9wID0g
MjsNCisJZWxzZSBpZiAoc3NjYW5mKHN0ciwgInJlYm9vdCAlMzJzIiwgYmxvY2tfbmFtZSkgPT0g
MSkNCisJCW9wID0gMzsNCiAJZWxzZSBpZiAoc3RyWzBdICYmIHN0clsxXSAmJiBzdHJbMl0gJiYg
c3RyWzNdKQ0KIAkJLyogYXNjaWkgc3RyaW5nLCBidXQgY29tbWFuZHMgYXJlIG5vdCBtYXRjaGVk
LiAqLw0KIAkJcmV0dXJuIC1FSU5WQUw7DQpAQCAtMjg3LDYgKzI4OSw5IEBAIHN0YXRpYyBzc2l6
ZV90IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBj
aGFyIF9fdXNlciAqDQogCQkvKiBkYXRhLmluamVjdC5hZGRyZXNzIGlzIG9mZnNldCBpbnN0ZWFk
IG9mIGFic29sdXRlIGdwdSBhZGRyZXNzICovDQogCQlyZXQgPSBhbWRncHVfcmFzX2Vycm9yX2lu
amVjdChhZGV2LCAmZGF0YS5pbmplY3QpOw0KIAkJYnJlYWs7DQorCWNhc2UgMzoNCisJCWFtZGdw
dV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCA9IHRydWU7DQorCQlicmVhazsNCiAJZGVm
YXVsdDoNCiAJCXJldCA9IC1FSU5WQUw7DQogCQlicmVhazsNCkBAIC0xNzMzLDYgKzE3MzgsOCBA
QCBpbnQgYW1kZ3B1X3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgdm9pZCBh
bWRncHVfcmFzX2dsb2JhbF9yYXNfaXNyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgew0K
IAlpZiAoYXRvbWljX2NtcHhjaGcoJmFtZGdwdV9yYXNfaW5faW50ciwgMCwgMSkgPT0gMCkgew0K
LQkJRFJNX1dBUk4oIlJBUyBldmVudCBvZiB0eXBlIEVSUkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBk
ZXRlY3RlZCEgU3RvcHBpbmcgYWxsIEdQVSBqb2JzLlxuIik7DQorCQlEUk1fV0FSTigiUkFTIGV2
ZW50IG9mIHR5cGUgRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUIGRldGVjdGVkIVxuIik7DQorDQor
CQlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCBmYWxzZSk7DQogCX0NCiB9DQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQppbmRleCAzZWMyYTg3Li5hODNlYzk5IDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCkBAIC0zMzMsNiArMzMzLDcg
QEAgc3RydWN0IGFtZGdwdV9yYXMgew0KIAlzdHJ1Y3QgbXV0ZXggcmVjb3ZlcnlfbG9jazsNCiAN
CiAJdWludDMyX3QgZmxhZ3M7DQorCWJvb2wgcmVib290Ow0KIH07DQogDQogc3RydWN0IHJhc19m
c19kYXRhIHsNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
