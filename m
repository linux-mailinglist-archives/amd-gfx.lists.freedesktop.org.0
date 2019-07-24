Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C5B731B4
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D516E536;
	Wed, 24 Jul 2019 14:32:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820073.outbound.protection.outlook.com [40.107.82.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F87A6E536
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:32:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZRAZMBnMZ/TsCvxDNfp45LG1bzuambtrLV5vbigUQvBFqOFQoa34L945pjMwuWgT00GcxIvaGogQe4vrRXDD3eU2SxB52w+X5ki34z124HDHnFyIZClmv4QjXTWSix2GBFfQOK7c7lpXteCNXevLpZtsjYgal7Ro5YyrsUzh2tf2KLBb9W/VMesZyTFL1/aZ5+WuqBH9j4SBcWANmw4EDtoTq0c8YZEJSTSnGRs0+WH+I2EJ7M1Qh48VmmRAL2fi4KYLB4JykUaFBrqhxMZppiFv7CE4i7PDCf5v67Ji05X5Cl+vPpsycnWzS+OzgR/RJ1pP6XnXwW4BzecR50E3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL1CHXLCI/eka87MDtDJRe4wc7DKbHdcG78iskNftjU=;
 b=YYZjkIggUJ2b6IlZBFj+S9n61mw8J1Sdu9U/+Iels1/gYEk8wp26bHIh0PwdKc4cSWuBXucooM2xrj7UA+Nf82jVJyQODp8NyAJ+h5sY523/UG81GeXIS+L96eQVzz4J74M7JCDGtE4QsWbeiBN+vtUmhrR3Xw0WWFJDYPrqcKCC3ExKHO0ljKdIUYM/2fyOtZgwgfIFG0zwCkd126Nh44ZZgcG7GvdXhfKWoUus2R5PyBwK1aNOhax1dRA1iIWbiG4kinhQhZjYdrYheLYz95pqa111dijk/zn7jgI0UzZki68S9VlHKCwcaMn80PLe+NB/gGHv3TGRyUMU3EO2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1535.namprd12.prod.outlook.com (10.172.50.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 14:32:33 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845%3]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 14:32:33 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Topic: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Index: AQHVQimxqk1YeojMgkC1mpHwDMisxqbZ0tSAgAACGIA=
Date: Wed, 24 Jul 2019 14:32:33 +0000
Message-ID: <e8a4de40-e60c-152a-ba4b-9ef7b1b553c1@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
 <492b52b5-36e0-f957-88e1-c2479f8c56c4@amd.com>
In-Reply-To: <492b52b5-36e0-f957-88e1-c2479f8c56c4@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::26) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 697a7717-f668-4563-8d0d-08d71043c422
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1535; 
x-ms-traffictypediagnostic: MWHPR12MB1535:
x-microsoft-antispam-prvs: <MWHPR12MB1535CBA6816CE2567AE65D21EAC60@MWHPR12MB1535.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(199004)(189003)(2501003)(486006)(8936002)(476003)(76176011)(31686004)(11346002)(2616005)(2906002)(81166006)(81156014)(6486002)(6436002)(6506007)(99286004)(446003)(102836004)(386003)(26005)(71190400001)(71200400001)(186003)(53546011)(14454004)(66066001)(6246003)(5660300002)(53936002)(31696002)(305945005)(6512007)(54906003)(4326008)(8676002)(3846002)(478600001)(52116002)(36756003)(110136005)(316002)(6116002)(66476007)(66946007)(64756008)(7736002)(14444005)(229853002)(66556008)(25786009)(256004)(86362001)(66446008)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1535;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CQ/RlwWMxaYj7KyYiYOC5509cIhr34pFGA+ije9v5OsXSBCMNlu/A4CVkcRmRAs5AYFqOGBkleoHOUZfYNv5SApNoNSbJoPEvucK/Evqrro59NNUhkGeVt+7Xz/CJ12h426CgdwzkH7ERFExPBIVlanhjqPKDlW6tI31eH1ombnAUibdAGoY4OIk18TT5lRZISBH3DS74re5RlcP/wsuq9KTNQT9HYQGp6knHKQ1G+IVzJ4gQaLzHM9gs5HApNJvKka7y3Xle1SYsb8jijqFxekPNynMmnwmzhe2NxkT0lCcxAtZ9ZO64t2caDcEGvo7szJ5oCTUIvpGbECePuZdbNmziv697WVWamL0omRIRvRRmr2QMaZWBaScOU15Rf4l5NgMO4H11KNoCJ2KNfznuDNufVzIfWyId5H8SRxkSyA=
Content-ID: <D929559C52D38842857C2C850546A1D8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697a7717-f668-4563-8d0d-08d71043c422
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:32:33.7718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL1CHXLCI/eka87MDtDJRe4wc7DKbHdcG78iskNftjU=;
 b=QLoAUpaqBt4jfSCDZ/OO9dvnA8+EFqwPiJxseFFWf1hxUWTHdh43+WZflMx1PXYXhgo7p7bGziBBiUoGM4nBBmM9Z8nC9dirftvzsSZ3PC++JZuO4lnNhwa0mobl3U05HMRZRuO/YISg9m/qlvpuIPOCSaByp5jn9P9K1uUTlkw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA3LzI0LzE5IDEwOjI1IEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4gQW0gMjQu
MDcuMTkgdW0gMTY6MTAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToNCj4+IEZyb206IFNoaXJp
c2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+DQo+Pg0KPj4gZW5hYmxlcyBncHVfdm1fc3VwcG9ydCBp
biBkbSBhbmQgYWRkcw0KPj4gQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFzIHN1cHBvcnRlZCBkb21h
aW4NCj4+DQo+PiB2MjoNCj4+IE1vdmUgQk8gcGxhY2VtZW50IGxvZ2ljIGludG8gYW1kZ3B1X2Rp
c3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMNCj4+DQo+PiB2MzoNCj4+IFVzZSBhbWRncHVfYm9fdmFs
aWRhdGVfdXN3YyBpbiBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucy4NCj4+DQo+PiBD
aGFuZ2UtSWQ6IElmMzQzMDBiZWFhNjBiZTJkMzYxNzBiN2I1YjA5NmVjNjQ0NTAyYjIwDQo+PiBT
aWduZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2guc0BhbWQuY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IEFj
dHVhbGx5IHRoYXQgZG9lc24ndCBsb29rIGxpa2UgYSBnb29kIGlkZWEgdG8gbWUuDQo+DQo+IEl0
IGlzIHN0aWxsIHBlcmZlY3RseSBwb3NzaWJsZSAoYW5kIHdhbnRlZCEpIHRoYXQgdGhlIFVTV0Mg
ZmxhZyB3YXMgbm90DQo+IHNldCBpbiB0aGUgZmlyc3QgcGxhY2UgYnkgdXNlcnNwYWNlLg0KPg0K
PiBJcyB0aGF0IHN0aWxsIGNoZWNrZWQgc29tZXdoZXJlPw0KPg0KPiBSZWdhcmRzLA0KPiBDaHJp
c3RpYW4uDQoNCg0KTm90IHN1cmUgSSB1bmRlcnN0YW5kIGhlcmUsIGNhbiB5b3UgZWxhYm9yYXRl
ID8NCg0KQW5kcmV5DQoNCg0KPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzcGxheS5jICAgICAgIHwgMTYgKysrKysrKysrKysrKystLQ0KPj4gICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAyICst
DQo+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
aXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jDQo+
PiBpbmRleCA3NjdlZTY5OS4uMjNiODA0NiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMNCj4+IEBAIC0zNyw2ICszNyw3IEBADQo+PiAgICAj
aW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+DQo+PiAgICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJh
bWVidWZmZXJfaGVscGVyLmg+DQo+PiAgICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4N
Cj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9jYWNoZS5oPg0KPj4gICAgDQo+PiAgICBzdGF0aWMgdm9p
ZCBhbWRncHVfZGlzcGxheV9mbGlwX2NhbGxiYWNrKHN0cnVjdCBkbWFfZmVuY2UgKmYsDQo+PiAg
ICAJCQkJCSBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikNCj4+IEBAIC00OTYsMTAgKzQ5NywyMSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBhbWRncHVfZmJfZnVu
Y3MgPSB7DQo+PiAgICB1aW50MzJfdCBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgIHsNCj4+ICAgIAl1aW50MzJfdCBkb21h
aW4gPSBBTURHUFVfR0VNX0RPTUFJTl9WUkFNOw0KPj4gKwl1NjQgdXN3Y19mbGFnID0gQU1ER1BV
X0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDOw0KPj4gICAgDQo+PiAgICAjaWYgZGVmaW5lZChDT05G
SUdfRFJNX0FNRF9EQykNCj4+IC0JaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8g
JiYgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTiAmJg0KPj4gLQkgICAgYWRldi0+ZmxhZ3Mg
JiBBTURfSVNfQVBVICYmDQo+PiArCS8qDQo+PiArCSAqIGlmIGFtZGdwdV9ib192YWxpZGF0ZV91
c3djIGNsZWFycyBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MgaXQNCj4+ICsJICogbWVh
bnMgdGhhdCBVU1dDIG1hcHBpbmdzDQo+PiArCSAqIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIHRoaXMg
Ym9hcmQuIEJ1dCB0aGlzIG1hcHBpbmcgaXMgcmVxdWlyZWQNCj4+ICsJICogdG8gYXZvaWQgaGFu
ZyBjYXVzZWQgYnkgcGxhY2VtZW50IG9mIHNjYW5vdXQgQk8gaW4gR1RUIG9uIGNlcnRhaW4NCj4+
ICsJICogQVBVcy4gU28gZm9yY2UgdGhlIEJPIHBsYWNlbWVudCB0byBWUkFNIGluIGNhc2UgdGhp
cyBhcmNoaXRlY3R1cmUNCj4+ICsJICogd2lsbCBub3QgYWxsb3cgVVNXQyBtYXBwaW5ncy4NCj4+
ICsJICovDQo+PiArCWFtZGdwdV9ib192YWxpZGF0ZV91c3djKCZ1c3djX2ZsYWcpOw0KPj4gKw0K
Pj4gKwlpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2ljX3R5
cGUgPD0gQ0hJUF9SQVZFTiAmJg0KPj4gKwkgICAgYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVICYm
IHVzd2NfZmxhZyAmJg0KPj4gICAgCSAgICBhbWRncHVfZGV2aWNlX2FzaWNfaGFzX2RjX3N1cHBv
cnQoYWRldi0+YXNpY190eXBlKSkNCj4+ICAgIAkJZG9tYWluIHw9IEFNREdQVV9HRU1fRE9NQUlO
X0dUVDsNCj4+ICAgICNlbmRpZg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+PiBpbmRleCA0OTIyNTg5Li5mMDM4N2NlMSAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMNCj4+IEBAIC02ODYsNyArNjg2LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1faW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgIAkgKi8NCj4+ICAgIAlpZiAoYWRl
di0+ZmxhZ3MgJiBBTURfSVNfQVBVICYmDQo+PiAgICAJICAgIGFkZXYtPmFzaWNfdHlwZSA+PSBD
SElQX0NBUlJJWk8gJiYNCj4+IC0JICAgIGFkZXYtPmFzaWNfdHlwZSA8IENISVBfUkFWRU4pDQo+
PiArCSAgICBhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJUF9SQVZFTikNCj4+ICAgIAkJaW5pdF9kYXRh
LmZsYWdzLmdwdV92bV9zdXBwb3J0ID0gdHJ1ZTsNCj4+ICAgIA0KPj4gICAgCWlmIChhbWRncHVf
ZGNfZmVhdHVyZV9tYXNrICYgRENfRkJDX01BU0spDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
