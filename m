Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A87B8051
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 19:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39876F46B;
	Thu, 19 Sep 2019 17:45:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790044.outbound.protection.outlook.com [40.107.79.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891906F46B
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 17:45:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRauEpFnMPCdnzGGANbGzFYOj6G3tBvBgWQRbUcq2suIUvrzZ2m4F1EgxUQOhw6px3fel0+aJpIAQBRdDIwN9e6M4uySc0HsdJNXqcWReLRyUNX0Et7jVZxN6+RE3r4VlB0DCM35lCU/Zpbte8FCUNCKQwZSgwVCy7arQ6wwG/2AzcAzE01e0pQ2ukWvCvw16IeCZTLntxfwlCaOAS7metzRxDlpEapQ43QhPKcACJyrIveJJ4M0eTh4s6I8ik8fmTgdX2Um4LedCy3lMR315L/ksvBkoG+P74SRT/47q4/iaQpFVY0VaMC6mYVuG71AS7Og9JLyxprpsDmQiwBdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uT0Rh9jQKOgpq3d5H5aWjCxEguI5Y28iVC0GQ4wizM=;
 b=fY9ZbpHihGh+xB4EabTreq6fiXBQoik+ab/5PnEfJI6Z0uQvXkGvO8p/UWddoCG0jfT6NRAgzY9LfKi8sdqQJd/y7uxhqkDyNpuDxEWj5g8Gv1mzSNXoKRY6rjOqlkUI+toumR4ULfApAqg3RDky3D71qFrQxIAVyu0jPv8C9Md8YVf7qSgCiUIOEp6URWkfAsQ9t3VASB8OESVKNJMbR6e/HcQucEDOHvKVhTXN98XSk6Udqky5FAcDcxR9kOeV+zzwaNmLfsmZd+QFsjh+UJ6d9Jcz3mTOwkcD8XuW+Ulhx03erQ3yZUOHy+O4RZoR6Nm/zLIccC/nORjAnixL5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2934.namprd12.prod.outlook.com (20.179.91.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Thu, 19 Sep 2019 17:45:27 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636%3]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 17:45:27 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display; Fix kernel doc warnings
Thread-Topic: [PATCH] drm/amd/display; Fix kernel doc warnings
Thread-Index: AQHVbxG4CRchTYbHLkOpMSX8VS+746czReEA
Date: Thu, 19 Sep 2019 17:45:27 +0000
Message-ID: <37bcfe0e-6ef8-cbbe-cdcc-b456a3a25353@amd.com>
References: <20190919174244.30192-1-harry.wentland@amd.com>
In-Reply-To: <20190919174244.30192-1-harry.wentland@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::15) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 515f1c17-c9fa-4099-9c21-08d73d2927eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2934; 
x-ms-traffictypediagnostic: BYAPR12MB2934:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2934FB5573A363652A7EDE7DEC890@BYAPR12MB2934.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(189003)(199004)(6512007)(7736002)(66476007)(3846002)(66446008)(102836004)(256004)(14444005)(64756008)(66556008)(71200400001)(71190400001)(486006)(476003)(2616005)(305945005)(4326008)(6246003)(446003)(11346002)(2501003)(229853002)(6486002)(76176011)(66066001)(6436002)(8936002)(6116002)(14454004)(66946007)(2906002)(81166006)(31696002)(186003)(81156014)(31686004)(5660300002)(6506007)(53546011)(386003)(52116002)(25786009)(478600001)(26005)(8676002)(36756003)(110136005)(86362001)(99286004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2934;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LqWJiZe1VT49rw/7GmPfTBTdCOgLaeT4Bz83DZZ/dPTakbbutKPScuKv2HxqB5RBK1lDv9DAe95qlIhV8N5xFQAa/NzeqYfyuaex7kju62RiYuyeYVj3uVJ6jBQ5epwZ39KzbRoHCP24n9F1AvHENWnyyoO2XKwvVBEYzvgscFyVv4GEB4EHe5/N2ECKDejulB/jAqWF84y7BGmdyy1wHZIMUB4Ep3yIf824WQoNfvUSfnrWVCVz/cbHlJ+DGVSR9k4CcR9p0B2V6ftB6l2MFqMy92HuMNukDaw5p3VX/Dn9ZhvNkGdUvJ6Fhzw9Bi2omxrAaAD7QBP6noBSJFhlG9NaQgzNB7wf3t5BesivXSYLJ88heb48l9i3EByynrs+I5hOwfaYHQBz1WHWJm8/y0V3LZQz/UrvjzCCE8VCYi0=
Content-ID: <811DF3724761CA4A9C14FFA4C303F7F3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515f1c17-c9fa-4099-9c21-08d73d2927eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 17:45:27.1988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQsKbw6xivG2ME1j6hx0X4j9OgBi2va2B3aZffXLS2hbsT7333peqC1uvAHDvPISOyQBcjcpraZ6tHUl7xoEZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uT0Rh9jQKOgpq3d5H5aWjCxEguI5Y28iVC0GQ4wizM=;
 b=Kv8m546zep9HQ6/5OLAYYWKZ7b6/SMnNpOIv2DV9K3kWgtFDzKBibYnmBOa8MADMxmLH0pT6VkI8F5TZaWUBYBAy2hPFN/+9gK6Z39U961Ywb8cBgoPB0QEWEaqoGxYd01RobXWVGyAFzAl71ks8Pc5xxJZRmcCXz2A+7iEwMgo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xOSAxOjQyIHAubS4sIEhhcnJ5IFdlbnRsYW5kIHdyb3RlOg0KPiBXZSBoYWQg
YSBjb3VwbGUgb2YgbWlzc2luZyBkZWZpbml0aW9ucyBhbmQgZm9ybWF0dGluZyBlcnJvcnMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyB8IDE0ICsrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaCB8IDEwICsrKysrKysrKy0NCj4gICAyIGZpbGVzIGNo
YW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBpbmRleCA3
ZDYyYjRlODYzODYuLjkyOGE4N2Y4OWYzMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IEBAIC0yNjEsNiArMjYxLDEz
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhbWRncHVfZG1fdnJyX2FjdGl2ZShzdHJ1Y3QgZG1fY3J0
Y19zdGF0ZSAqZG1fc3RhdGUpDQo+ICAgCSAgICAgICBkbV9zdGF0ZS0+ZnJlZXN5bmNfY29uZmln
LnN0YXRlID09IFZSUl9TVEFURV9BQ1RJVkVfRklYRUQ7DQo+ICAgfQ0KPiAgIA0KPiArLyoqDQo+
ICsgKiBkbV9wZmxpcF9oaWdoX2lycSgpIC0gSGFuZGxlIHBhZ2VmbGlwIGludGVycnVwdA0KPiAr
ICogQGludGVycnVwdF9wYXJhbXM6IGlnbm9yZWQNCj4gKyAqDQo+ICsgKiBIYW5kbGVzIHRoZSBw
YWdlZmxpcCBpbnRlcnJ1cHQgYnkgbm90ZnlpbmcgYWxsIGludGVyZXN0ZWQgcGFydGllcw0KDQpT
aG91bGQgYmUgIm5vdGlmeWluZyIuDQoNCldpdGggdGhhdCBmaXhlZCwNCg0KUmV2aWV3ZWQtYnk6
IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCg0KPiAr
ICogdGhhdCB0aGUgcGFnZWZsaXAgaGFzIGJlZW4gY29tcGxldGVkLg0KPiArICovDQo+ICAgc3Rh
dGljIHZvaWQgZG1fcGZsaXBfaGlnaF9pcnEodm9pZCAqaW50ZXJydXB0X3BhcmFtcykNCj4gICB7
DQo+ICAgCXN0cnVjdCBhbWRncHVfY3J0YyAqYW1kZ3B1X2NydGM7DQo+IEBAIC00MDUsNiArNDEy
LDEzIEBAIHN0YXRpYyB2b2lkIGRtX3Z1cGRhdGVfaGlnaF9pcnEodm9pZCAqaW50ZXJydXB0X3Bh
cmFtcykNCj4gICAJfQ0KPiAgIH0NCj4gICANCj4gKy8qKg0KPiArICogZG1fY3J0Y19oaWdoX2ly
cSgpIC0gSGFuZGxlcyBDUlRDIGludGVycnVwdA0KPiArICogQGludGVycnVwdF9wYXJhbXM6IGln
bm9yZWQNCj4gKyAqDQo+ICsgKiBIYW5kbGVzIHRoZSBDUlRDL1ZTWU5DIGludGVycnVwdCBieSBu
b3RmeWluZyBEUk0ncyBWQkxBTksNCj4gKyAqIGV2ZW50IGhhbmRsZXIuDQo+ICsgKi8NCj4gICBz
dGF0aWMgdm9pZCBkbV9jcnRjX2hpZ2hfaXJxKHZvaWQgKmludGVycnVwdF9wYXJhbXMpDQo+ICAg
ew0KPiAgIAlzdHJ1Y3QgY29tbW9uX2lycV9wYXJhbXMgKmlycV9wYXJhbXMgPSBpbnRlcnJ1cHRf
cGFyYW1zOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmgNCj4gaW5kZXggMTdhMzViNTA0NTUyLi5hZjIwMjVmM2FjMWEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
aA0KPiBAQCAtMTA1LDYgKzEwNSwxMiBAQCBzdHJ1Y3QgYW1kZ3B1X2RtX2JhY2tsaWdodF9jYXBz
IHsNCj4gICAgKiBAZGlzcGxheV9pbmRleGVzX251bTogTWF4IG51bWJlciBvZiBkaXNwbGF5IHN0
cmVhbXMgc3VwcG9ydGVkDQo+ICAgICogQGlycV9oYW5kbGVyX2xpc3RfdGFibGVfbG9jazogU3lu
Y2hyb25pemVzIGFjY2VzcyB0byBJUlEgdGFibGVzDQo+ICAgICogQGJhY2tsaWdodF9kZXY6IEJh
Y2tsaWdodCBjb250cm9sIGRldmljZQ0KPiArICogQGJhY2tsaWdodF9saW5rOiBMaW5rIG9uIHdo
aWNoIHRvIGNvbnRyb2wgYmFja2xpZ2h0DQo+ICsgKiBAYmFja2xpZ2h0X2NhcHM6IENhcGFiaWxp
dGllcyBvZiB0aGUgYmFja2xpZ2h0IGRldmljZQ0KPiArICogQGZyZWVzeW5jX21vZHVsZTogTW9k
dWxlIGhhbmRsaW5nIGZyZWVzeW5jIGNhbGN1bGF0aW9ucw0KPiArICogQGZ3X2RtY3U6IFJlZmVy
ZW5jZSB0byBETUNVIGZpcm13YXJlDQo+ICsgKiBAZG1jdV9md192ZXJzaW9uOiBWZXJzaW9uIG9m
IHRoZSBETUNVIGZpcm13YXJlDQo+ICsgKiBAc29jX2JvdW5kaW5nX2JveDogU09DIGJvdW5kaW5n
IGJveCB2YWx1ZXMgcHJvdmlkZWQgYnkgZ3B1X2luZm8gRlcNCj4gICAgKiBAY2FjaGVkX3N0YXRl
OiBDYWNoZXMgZGV2aWNlIGF0b21pYyBzdGF0ZSBmb3Igc3VzcGVuZC9yZXN1bWUNCj4gICAgKiBA
Y29tcHJlc3NvcjogRnJhbWUgYnVmZmVyIGNvbXByZXNzaW9uIGJ1ZmZlci4gU2VlICZzdHJ1Y3Qg
ZG1fY29tcmVzc29yX2luZm8NCj4gICAgKi8NCj4gQEAgLTEyNSw3ICsxMzEsNyBAQCBzdHJ1Y3Qg
YW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciB7DQo+ICAgCXUxNiBkaXNwbGF5X2luZGV4ZXNfbnVtOw0K
PiAgIA0KPiAgIAkvKioNCj4gLQkgKiBAYXRvbWljX29iag0KPiArCSAqIEBhdG9taWNfb2JqOg0K
PiAgIAkgKg0KPiAgIAkgKiBJbiBjb21iaW5hdGlvbiB3aXRoICZkbV9hdG9taWNfc3RhdGUgaXQg
aGVscHMgbWFuYWdlDQo+ICAgCSAqIGdsb2JhbCBhdG9taWMgc3RhdGUgdGhhdCBkb2Vzbid0IG1h
cCBjbGVhbmx5IGludG8gZXhpc3RpbmcNCj4gQEAgLTIzMSw2ICsyMzcsOCBAQCBzdHJ1Y3QgYW1k
Z3B1X2Rpc3BsYXlfbWFuYWdlciB7DQo+ICAgCXVpbnQzMl90IGRtY3VfZndfdmVyc2lvbjsNCj4g
ICAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8wDQo+ICAgCS8qKg0KPiArCSAqIEBzb2Nf
Ym91bmRpbmdfYm94Og0KPiArCSAqDQo+ICAgCSAqIGdwdV9pbmZvIEZXIHByb3ZpZGVkIHNvYyBi
b3VuZGluZyBib3ggc3RydWN0IG9yIDAgaWYgbm90DQo+ICAgCSAqIGF2YWlsYWJsZSBpbiBGVw0K
PiAgIAkgKi8NCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
