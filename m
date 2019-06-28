Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BB95945D
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 08:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB2A6E884;
	Fri, 28 Jun 2019 06:48:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800080.outbound.protection.outlook.com [40.107.80.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA08E6E886
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 06:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=aAKnftAquYzm0nHAHI6XEzI6WccM5MRfXy0etT599ITt/Svu2dhlXZi5lwfTUXGYYQQRh/GRKH8OEzO6wJXyGvMUjBYxp7d/8RK2lGQnOdPVOHnoAlD67wKG7x4uki0C19rRqXQgBi9bHcdGMX4ol6NYeMfQoAxF5rhEDvnLXOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5dTqewv3ImgYO3hGQi7qP9ViYKtCIIK+hiMXChN1l0=;
 b=IGJr5Ud9CESKRbakl5neXV8vRlKKYKjsXGQFptiPuSNoiHwr/MwyvSAQBCQr0dtutSu6Pq6gPu00HHXSzCzOeQbOQEJM7BG3H5UXqKznQ9wftkfyXNaq98/mBAMXK6bgHjdDIOMyZ1VQhsXhZhOferuvkZe1bsK0jGraM2UUke0=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1195.namprd12.prod.outlook.com (10.168.240.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 06:48:14 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 06:48:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVLM+JtftM5gXUOEyqva4XabrZI6avSXoAgAFCeQCAABVRAA==
Date: Fri, 28 Jun 2019 06:48:14 +0000
Message-ID: <9da42931-f800-d84d-054c-4d4a2a98c12a@amd.com>
References: <1561629780-21649-1-git-send-email-flora.cui@amd.com>
 <379c7272-a581-d3f2-582c-fbb92d59f00f@gmail.com>
 <86b459d5-8c11-c68c-9b14-0c5adf103a9e@amd.com>
In-Reply-To: <86b459d5-8c11-c68c-9b14-0c5adf103a9e@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0198.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::18) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23ae1654-7ae5-4938-8898-08d6fb9497b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1195; 
x-ms-traffictypediagnostic: DM5PR12MB1195:
x-microsoft-antispam-prvs: <DM5PR12MB11950C00BA3C92884C4F9E3083FC0@DM5PR12MB1195.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(199004)(189003)(31686004)(256004)(6506007)(64756008)(305945005)(66476007)(66556008)(66446008)(65826007)(81156014)(73956011)(66946007)(52116002)(65806001)(99286004)(68736007)(102836004)(478600001)(72206003)(186003)(14454004)(65956001)(25786009)(2501003)(7736002)(66574012)(76176011)(386003)(2906002)(446003)(8936002)(6486002)(6116002)(229853002)(53936002)(14444005)(71200400001)(71190400001)(5660300002)(36756003)(6512007)(11346002)(46003)(316002)(6246003)(2616005)(110136005)(486006)(86362001)(64126003)(476003)(31696002)(8676002)(81166006)(58126008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1195;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7py2H4ElRPpUKjySwNBBdyPS6jKBrVXTt51eXo1oZapKhVt6rK2mmQbmh8InMezgdAes8EpzKvXFckGzBaWmiQay3/9ng68Cmh9GeIPFh2NU/H1hXZ+BLptpgQtUBpPzYGOpkw125+ezoAUTaLd4xr5xS0Umvdb/t69qngDR5oLFDe35kHRlthv96jYJaSSu17OGzeUCBcTy0qzAHA5mNIRc52orYiSFiLMUykXugzmSzj2iw1sF98PX0jLIkZ7iqnTSeN/P0tJlCouz5MzyLlfrQzXaETIO83F2qX5F4m35K8FPM8DFSZJAYNCQhzg72ahdiud/oNCb6/iodQ3LrdCWCzTrojCAFMY78gzKqqsgvtdh/J/aRFQDTCkSt6tVtoaemLybrL6o6fIsdoYPIbFiCi3NSCQvJ4phuzhQDDU=
Content-ID: <0F675DB7330FC84DAFA106F5DB7C7B5D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ae1654-7ae5-4938-8898-08d6fb9497b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 06:48:14.1385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1195
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5dTqewv3ImgYO3hGQi7qP9ViYKtCIIK+hiMXChN1l0=;
 b=SGQNH8uGPc+cKL5pYUfnKU23bmlmCO08E6oBz+pJafoB6TEhvKBkStxpq0ZyZ3iHnTduhCGUCpevLCT24SQDleZuGd1n4beiymc3F5f7p2zftgLy88VfOlxvWHkcIUxemgnI0ndqqZHd2K41/tUwiFx80hAPUEaqB9VipFrO7OM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

QW0gMjguMDYuMTkgdW0gMDc6MzIgc2NocmllYiBDdWksIEZsb3JhOg0KPiDlnKggNi8yNy8yMDE5
IDY6MTcgUE0sIENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGTOg0KPj4gQW0gMjcuMDYuMTkgdW0gMTI6
MDMgc2NocmllYiBDdWksIEZsb3JhOg0KPj4+IHNjaGVkdWxlciB0aW1lb3V0IGlzIGluIGppZmZp
ZXMNCj4+PiB2MjogbW92ZSB0aW1lb3V0IGNoZWNrIHRvIGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90
aW1lb3V0X3NldHRpbmdzIGFmdGVyDQo+Pj4gcGFyc2luZyB0aGUgdmFsdWUNCj4+Pg0KPj4+IENo
YW5nZS1JZDogSTI2NzA4YzE2M2RiOTQzZmY4ZDkzMGRkODFiY2FiNGI0YjlkODRlYjINCj4+PiBT
aWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPg0KPj4+IC0tLQ0KPj4+
ICDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA3ICsrKysrLS0N
Cj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPj4+
IGluZGV4IGU3NGExNzUuLmNjMjlkNzAgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jDQo+Pj4gQEAgLTEzMDAsNyArMTMwMCw5IEBAIGludA0KPj4+IGFt
ZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQ0KPj4+ICDCoMKgwqDCoMKgwqAgKiBCeSBkZWZhdWx0IHRpbWVvdXQgZm9yIG5vbiBj
b21wdXRlIGpvYnMgaXMgMTAwMDAuDQo+Pj4gIMKgwqDCoMKgwqDCoCAqIEFuZCB0aGVyZSBpcyBu
byB0aW1lb3V0IGVuZm9yY2VkIG9uIGNvbXB1dGUgam9icy4NCj4+PiAgwqDCoMKgwqDCoMKgICov
DQo+Pj4gLcKgwqDCoCBhZGV2LT5nZnhfdGltZW91dCA9IGFkZXYtPnNkbWFfdGltZW91dCA9IGFk
ZXYtPnZpZGVvX3RpbWVvdXQgPQ0KPj4+IDEwMDAwOw0KPj4+ICvCoMKgwqAgYWRldi0+Z2Z4X3Rp
bWVvdXQgPSBcDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPnNkbWFfdGltZW91dCA9IFwNCj4+
PiArwqDCoMKgwqDCoMKgwqAgYWRldi0+dmlkZW9fdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMo
MTAwMDApOw0KPj4gT2YgaGFuZCB0aGF0IGxvb2tzIHZlcnkgb2RkIHRvIG1lLiBUaGlzIGlzIG5v
dCBhIG1hY3JvIHNvIHdoeSB0aGUgXCBoZXJlPw0KPiB3aWxsIHVwZGF0ZSBpbiB2Mw0KPj4+ICDC
oMKgwqDCoMKgIGFkZXYtPmNvbXB1dGVfdGltZW91dCA9IE1BWF9TQ0hFRFVMRV9USU1FT1VUOw0K
Pj4+ICDCoCDCoMKgwqDCoMKgIGlmIChzdHJubGVuKGlucHV0LCBBTURHUFVfTUFYX1RJTUVPVVRf
UEFSQU1fTEVOVEgpKSB7DQo+Pj4gQEAgLTEzMTQsNyArMTMxNiw4IEBAIGludA0KPj4+IGFtZGdw
dV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodGltZW91dCA8PSAwKSB7
DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5kZXgrKzsNCj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlDQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lb3V0ID0gbXNlY3NfdG9famlm
Zmllcyh0aW1lb3V0KTsNCj4+IFlvdSBjYW4gYWN0dWFsbHkgcmVtb3ZlIHRoZSAiaWYgKHRpbWVv
dXQgPD0gMCkiIGFzIHdlbGwsDQo+PiBtc2Vjc190b19qaWZmaWVzIHdpbGwgZG8gdGhlIHJpZ2h0
IHRoaW5nIGZvciBuZWdhdGl2ZSB2YWx1ZXMuDQo+IElNSE8gY2hlY2sgZm9yIHRpbWVvdXQ9PTAg
aXMgc3RpbGwgbmVlZGVkLiBtc2Vjc190b19qaWZmaWVzKCkgd291bGQNCj4gcmV0dXJuIDAgYW5k
IHRoYXQncyBub3QgZGVzaXJlZCBmb3Igc2NoZWR1bGVyIHRpbWVyLg0KDQpHb29kIHBvaW50LCBz
byAwIHdvdWxkIHVzZSB0aGUgZGVmYXVsdCB2YWx1ZSBhbmQgbmVnYXRpdmUgdmFsdWVzIHdvdWxk
IA0KdXNlIGluZmluaXR5Lg0KDQpUaGF0IHNvdW5kcyBsaWtlIGEgZ29vZCBzb2x1dGlvbiB0byBt
ZSwNCkNocmlzdGlhbi4NCg0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4+PiAgwqAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3dpdGNoIChpbmRleCsrKSB7DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNhc2UgMDoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
