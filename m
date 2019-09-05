Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9CAA371
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 14:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A7A89D43;
	Thu,  5 Sep 2019 12:45:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0245B89D43
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 12:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw905eY5uUJ1YKrZosGN3gFm8jf+XaCFfnDykbIxiGg8M9sxkXx8W/S7BkGK9lVIMpPlXPFfHuldnNdtUqbqg4GtYoyzI4bydqaPbhsy8fMNPWXpYhn/0TRN6OzRprM4SpKNwIZ50lAyuad4NtOqhJ1NkB8NuVny9rfAAoF4Czd4x6HpZ2OB1Nk1Y6oOphX7VtXF16BZSmBUh8KFid/FLr057e4HVD6lnPbY4DoYz4zxiIhBk5ttw+KdW9Gx+usaIyyy0V3KFyo4D5Rad94swrb9BAEAQOd7aA3MA6S1wVTrvdUe/S0sezmE7gDK6VP2YnBfDsZPIc1NgGUWcR2Vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhAN45nUMD8cl9zMiCD+1ZwUwHQZMYFTNNQeWgT+PVM=;
 b=E0Sh3PQgZO7wLLhkJ9mLl8Vi/qejhXWs7gEKtz2/k2p9aVewKYnK4ANZuIICbWU+kOFpruOLpijs0ESgV6jB+szRgYvdBQJEBN7IPj/E/VuBPq9EtaWNVK/8+V4dRqj9f2wz+Ph6xsvXwhEHGYoB/rnYkJKdsMYm0Ugmrj6D+IO1Gt8E5D4Q6r2l7j1wvyvM0gN+nMsvSFFjcKkDKZX1ri6B3wxYmYOHhkDRkzvq/8nV0jvJ1WS5lfFB3l0pdIi9sxdEtZhTb3lOdUk+Gx78tusTArvk1enVBUmevOQRmlKLSlZ3xsYeNGgHWO1N+H9LvZCohVXnMttwfFeB+nDCng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3061.namprd12.prod.outlook.com (20.178.54.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 5 Sep 2019 12:45:55 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 12:45:55 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Roman" <Roman.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Add stereo mux and dig programming calls
 for dcn21
Thread-Topic: [PATCH] drm/amd/display: Add stereo mux and dig programming
 calls for dcn21
Thread-Index: AQHVY2nPJUBwLCfDJ0CBg8fxSz4SP6cdCN0A
Date: Thu, 5 Sep 2019 12:45:54 +0000
Message-ID: <384b634b-6650-d4d0-6e86-9ef9af6385ff@amd.com>
References: <1567633392-26602-1-git-send-email-Roman.Li@amd.com>
In-Reply-To: <1567633392-26602-1-git-send-email-Roman.Li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c91f593-f667-4513-6729-08d731fefdc9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3061; 
x-ms-traffictypediagnostic: BYAPR12MB3061:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB306141DB07134950EA2DEFF1ECBB0@BYAPR12MB3061.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(8676002)(81156014)(81166006)(6512007)(6246003)(53936002)(102836004)(186003)(6436002)(6486002)(66066001)(305945005)(76176011)(52116002)(4326008)(99286004)(446003)(25786009)(2616005)(2906002)(486006)(110136005)(54906003)(316002)(8936002)(229853002)(26005)(53546011)(386003)(6506007)(256004)(14444005)(3846002)(86362001)(5660300002)(71190400001)(64756008)(66446008)(66556008)(476003)(11346002)(7736002)(6116002)(71200400001)(31686004)(66476007)(31696002)(66946007)(36756003)(478600001)(14454004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3061;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SfcOeNac5htRCXX/xTd1IUZ5YqCFGcQdCa7r+ok5SzSjy/Bl5ozqRblxp0u18qqJlr0SQo8n3vwcMFym3g3CyYEi0D4L+1C6n7/cyUZkkTc6Zm9kDeViMixigQYot/pYuaeQrfFrBHfSq8B0sUx+N7bTWOolfRQAinQDvmMcqKUrdVd2W6nyCqDDoujweJwKiSbEdBK4TU+f5gC2uLzMvYRDeoo613wfSKO3EIHrlqCm1XxhYQrrkIeGXXmfZgDNsDsBJtvI44lVaPaeiY+IbOZe+6oWgRjRl9BvSzQLWDlewgdhCYNfCKxkuwJNvwkJxuDgQq+IkFFWuEdne1cnTa9LYXDj27AvabVtDEdtotMv2HIql3MsRrbEkmJBKgwAp7Sg38kI2PAO1XohMQmaudDRWDck21m5iebRSwc5Y24=
Content-ID: <47973C2678A1A84B833597A525F902A5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c91f593-f667-4513-6729-08d731fefdc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 12:45:54.9491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EPag05B4AUSr89FHtlM/k9MXkIpLdaNyv0Xwos7iaWQFmeVR30jT0yOj5cNSxrGo0K4mPcDZq6bYAdg0/suxuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3061
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhAN45nUMD8cl9zMiCD+1ZwUwHQZMYFTNNQeWgT+PVM=;
 b=F3LSp0PLAgNsFa3TFh2F/Pn62qp7vJ6sPW57dl7c3eZtE1IcoyNbnDZTfgDPV927Yffd1loaNfVAzLsFrcfcznHMk1vrxug73U/RWo/aYj+59Sw06Dec9k4yqIpvztaXyqQ8udE7W2u+/gxyyMaMd1dsm1kzE8smCPrq7jBttgc=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wNCA1OjQzIHAubS4sIFJvbWFuLkxpQGFtZC5jb20gd3JvdGU6DQo+IEZyb206
IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29tPg0KPiANCj4gW1doeV0NCj4gVGhlIGVhcmxpZXIg
cGF0Y2ggIkhvb2sgdXAgY2FsbHMgdG8gZG8gc3RlcmVvIG11eCBhbmQgZGlnIHByb2dyYW1taW5n
Li4uIg0KPiBkb2Vzbid0IGluY2x1ZGUgdXBkYXRlIGZvciBkY24yMS4NCj4gDQo+IFtIb3ddDQo+
IEFsaWduIGRjbjIxIGdwaW8gc2V0dGluZ3Mgd2l0aCB1cGRhdGVkIHN0ZXJlbyBjb250cm9sIGlu
dGVyZmFjZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29t
Pg0KDQpUaGUgcGF0Y2ggaXRzZWxmIGxvb2tzIGdvb2QgYnV0IHRoZSBjb21taXQgZGVzY3JpcHRp
b24gZG9lc24ndCBhY3R1YWxseSANCmRlc2NyaWJlIHdoYXQncyBiZWluZyBkb25lIGhlcmUgLSB0
aGlzIGRvZXNuJ3QgaG9vayB1cCBwcm9ncmFtbWluZyANCmNhbGxzLCBpdCBqdXN0IGZpbGxzIHRo
ZSBkY24yMSBncGlvIGdlbmVyaWMgcmVnaXN0ZXJzIHRoYXQgd2VyZSANCnByZXZpb3VzbHkgbWlz
c2luZy4NCg0KTmljaG9sYXMgS2F6bGF1c2thcw0KDQo+IC0tLQ0KPiAgIC4uLi9hbWQvZGlzcGxh
eS9kYy9ncGlvL2RjbjIxL2h3X2ZhY3RvcnlfZGNuMjEuYyAgIHwgMzggKysrKysrKysrKysrKysr
KysrKystLQ0KPiAgIC4uLi9hbWQvZGlzcGxheS9kYy9ncGlvL2RjbjIxL2h3X3RyYW5zbGF0ZV9k
Y24yMS5jIHwgIDMgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2dwaW8vZGNuMjEvaHdfZmFjdG9yeV9kY24yMS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2dwaW8vZGNuMjEvaHdfZmFjdG9yeV9kY24yMS5jDQo+IGluZGV4IDM0NDg1
ZDkuLjg1NzI2NzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9ncGlvL2RjbjIxL2h3X2ZhY3RvcnlfZGNuMjEuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZ3Bpby9kY24yMS9od19mYWN0b3J5X2RjbjIxLmMNCj4gQEAgLTM1LDEy
ICszNSwxMCBAQA0KPiAgIA0KPiAgICNpbmNsdWRlICJod19mYWN0b3J5X2RjbjIxLmgiDQo+ICAg
DQo+IC0NCj4gICAjaW5jbHVkZSAiZGNuL2Rjbl8yXzFfMF9vZmZzZXQuaCINCj4gICAjaW5jbHVk
ZSAiZGNuL2Rjbl8yXzFfMF9zaF9tYXNrLmgiDQo+ICAgI2luY2x1ZGUgInJlbm9pcl9pcF9vZmZz
ZXQuaCINCj4gICANCj4gLQ0KPiAgICNpbmNsdWRlICJyZWdfaGVscGVyLmgiDQo+ICAgI2luY2x1
ZGUgIi4uL2hwZF9yZWdzLmgiDQo+ICAgLyogYmVnaW4gKioqKioqKioqKioqKioqKioqKioqDQo+
IEBAIC0xMzYsNiArMTM0LDM5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGRjX3NoX21hc2sgZGRj
X21hc2tbXSA9IHsNCj4gICAJRERDX01BU0tfU0hfTElTVF9EQ04yKF9NQVNLLCA2KQ0KPiAgIH07
DQo+ICAgDQo+ICsjaW5jbHVkZSAiLi4vZ2VuZXJpY19yZWdzLmgiDQo+ICsNCj4gKy8qIHNldCBm
aWVsZCBuYW1lICovDQo+ICsjZGVmaW5lIFNGX0dFTkVSSUMocmVnX25hbWUsIGZpZWxkX25hbWUs
IHBvc3RfZml4KVwNCj4gKwkuZmllbGRfbmFtZSA9IHJlZ19uYW1lICMjIF9fICMjIGZpZWxkX25h
bWUgIyMgcG9zdF9maXgNCj4gKw0KPiArI2RlZmluZSBnZW5lcmljX3JlZ3MoaWQpIFwNCj4gK3tc
DQo+ICsJR0VORVJJQ19SRUdfTElTVChpZClcDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZ2VuZXJpY19yZWdpc3RlcnMgZ2VuZXJpY19yZWdzW10gPSB7DQo+ICsJZ2VuZXJpY19y
ZWdzKEEpLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBnZW5lcmljX3NoX21h
c2sgZ2VuZXJpY19zaGlmdFtdID0gew0KPiArCUdFTkVSSUNfTUFTS19TSF9MSVNUKF9fU0hJRlQs
IEEpLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBnZW5lcmljX3NoX21hc2sg
Z2VuZXJpY19tYXNrW10gPSB7DQo+ICsJR0VORVJJQ19NQVNLX1NIX0xJU1QoX01BU0ssIEEpLA0K
PiArfTsNCj4gKw0KPiArc3RhdGljIHZvaWQgZGVmaW5lX2dlbmVyaWNfcmVnaXN0ZXJzKHN0cnVj
dCBod19ncGlvX3BpbiAqcGluLCB1aW50MzJfdCBlbikNCj4gK3sNCj4gKwlzdHJ1Y3QgaHdfZ2Vu
ZXJpYyAqZ2VuZXJpYyA9IEhXX0dFTkVSSUNfRlJPTV9CQVNFKHBpbik7DQo+ICsNCj4gKwlnZW5l
cmljLT5yZWdzID0gJmdlbmVyaWNfcmVnc1tlbl07DQo+ICsJZ2VuZXJpYy0+c2hpZnRzID0gJmdl
bmVyaWNfc2hpZnRbZW5dOw0KPiArCWdlbmVyaWMtPm1hc2tzID0gJmdlbmVyaWNfbWFza1tlbl07
DQo+ICsJZ2VuZXJpYy0+YmFzZS5yZWdzID0gJmdlbmVyaWNfcmVnc1tlbl0uZ3BpbzsNCj4gK30N
Cj4gKw0KPiAgIHN0YXRpYyB2b2lkIGRlZmluZV9kZGNfcmVnaXN0ZXJzKA0KPiAgIAkJc3RydWN0
IGh3X2dwaW9fcGluICpwaW4sDQo+ICAgCQl1aW50MzJfdCBlbikNCj4gQEAgLTE4MSw3ICsyMTIs
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGh3X2ZhY3RvcnlfZnVuY3MgZnVuY3MgPSB7DQo+ICAg
CS5nZXRfaHBkX3BpbiA9IGRhbF9od19ocGRfZ2V0X3BpbiwNCj4gICAJLmdldF9nZW5lcmljX3Bp
biA9IGRhbF9od19nZW5lcmljX2dldF9waW4sDQo+ICAgCS5kZWZpbmVfaHBkX3JlZ2lzdGVycyA9
IGRlZmluZV9ocGRfcmVnaXN0ZXJzLA0KPiAtCS5kZWZpbmVfZGRjX3JlZ2lzdGVycyA9IGRlZmlu
ZV9kZGNfcmVnaXN0ZXJzDQo+ICsJLmRlZmluZV9kZGNfcmVnaXN0ZXJzID0gZGVmaW5lX2RkY19y
ZWdpc3RlcnMsDQo+ICsJLmRlZmluZV9nZW5lcmljX3JlZ2lzdGVycyA9IGRlZmluZV9nZW5lcmlj
X3JlZ2lzdGVycw0KPiAgIH07DQo+ICAgLyoNCj4gICAgKiBkYWxfaHdfZmFjdG9yeV9kY24xMF9p
bml0DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9k
Y24yMS9od190cmFuc2xhdGVfZGNuMjEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9ncGlvL2RjbjIxL2h3X3RyYW5zbGF0ZV9kY24yMS5jDQo+IGluZGV4IGFkN2M0MzcuLmZiYjU4
ZmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2Rj
bjIxL2h3X3RyYW5zbGF0ZV9kY24yMS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9ncGlvL2RjbjIxL2h3X3RyYW5zbGF0ZV9kY24yMS5jDQo+IEBAIC01OCw3ICs1OCw2
IEBADQo+ICAgI2RlZmluZSBTRl9IUEQocmVnX25hbWUsIGZpZWxkX25hbWUsIHBvc3RfZml4KVwN
Cj4gICAJLmZpZWxkX25hbWUgPSByZWdfbmFtZSAjIyBfXyAjIyBmaWVsZF9uYW1lICMjIHBvc3Rf
Zml4DQo+ICAgDQo+IC0NCj4gICAvKiBtYWNyb3MgdG8gZXhwZW5kIHJlZ2lzdGVyIGxpc3QgbWFj
cm8gZGVmaW5lZCBpbiBIVyBvYmplY3QgaGVhZGVyIGZpbGUNCj4gICAgKiBlbmQgKioqKioqKioq
KioqKioqKioqKioqLw0KPiAgIA0KPiBAQCAtNzEsNyArNzAsNyBAQCBzdGF0aWMgYm9vbCBvZmZz
ZXRfdG9faWQoDQo+ICAgew0KPiAgIAlzd2l0Y2ggKG9mZnNldCkgew0KPiAgIAkvKiBHRU5FUklD
ICovDQo+IC0JY2FzZSBSRUcoRENfR0VORVJJQ0EpOg0KPiArCWNhc2UgUkVHKERDX0dQSU9fR0VO
RVJJQ19BKToNCj4gICAJCSppZCA9IEdQSU9fSURfR0VORVJJQzsNCj4gICAJCXN3aXRjaCAobWFz
aykgew0KPiAgIAkJY2FzZSBEQ19HUElPX0dFTkVSSUNfQV9fRENfR1BJT19HRU5FUklDQV9BX01B
U0s6DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
