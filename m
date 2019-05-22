Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70026712
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 17:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6981E89A91;
	Wed, 22 May 2019 15:42:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E26789A91
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 15:42:47 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2502.namprd12.prod.outlook.com (10.172.121.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 15:42:44 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 15:42:44 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/display: Use new connector state when getting
 color depth
Thread-Topic: [PATCH 2/2] drm/amd/display: Use new connector state when
 getting color depth
Thread-Index: AQHVELC1+fwqsHDPx0GfoJ536+T7vaZ3SHkA
Date: Wed, 22 May 2019 15:42:44 +0000
Message-ID: <ae6286d5-236b-1b5d-81cd-214513113394@amd.com>
References: <20190522151116.22916-1-nicholas.kazlauskas@amd.com>
 <20190522151116.22916-2-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190522151116.22916-2-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTBPR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::28) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a1ac5b0-3877-4ed2-bdd1-08d6decc21e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2502; 
x-ms-traffictypediagnostic: CY4PR1201MB2502:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB25021E29881C63DA7421546D8C000@CY4PR1201MB2502.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(396003)(366004)(199004)(189003)(99286004)(6246003)(72206003)(64126003)(54906003)(3846002)(186003)(26005)(8936002)(476003)(2616005)(966005)(58126008)(4326008)(31696002)(6116002)(52116002)(5660300002)(110136005)(76176011)(2906002)(65826007)(25786009)(14454004)(53936002)(478600001)(316002)(256004)(229853002)(6436002)(71190400001)(66476007)(66556008)(14444005)(65806001)(66066001)(71200400001)(386003)(6506007)(53546011)(66446008)(64756008)(486006)(66946007)(102836004)(65956001)(6486002)(81166006)(81156014)(31686004)(8676002)(446003)(11346002)(6512007)(6306002)(73956011)(68736007)(7736002)(36756003)(2501003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2502;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x5dlb6UUbHMZUE0VMRR1gWxnkLd5Q6StouFbhgXADJCzcmfKsruOV5cFsabxHrXAO9fSdYdCrHZThRnW855uYty4KBz4R6x/1SZHYgfZuKnXmZn/yoxpUosX3KixdybfxmMk87KuA8po8Zen2M2TnCqpaudC3BDOLWJN2k3nIfMJgyjpmQo+ol1ms18JT9o9YE42R7+bQv/tliidd19+ebHC0jfgP58urvmNZ4DUGpW66keOXq+aW7D1OFmWxa5IITW0iuDRpK74iXkC3fdPDamImvwuu8cxOtPKesjB7xM5ytRSYQBbghX4RX+t1w7wns8edTOxf7LYUpHlAT4H8gZU0uN/kCJ7GJCiR98RZgKttEu9uMz9RfEkN17g0/VDcw2DICHuI0rsb2+AtZExQPIfHEopNlnP2RDbpapNN28=
Content-ID: <6E2C000A70989641BC18F317F0DDFD9C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1ac5b0-3877-4ed2-bdd1-08d6decc21e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:42:44.5749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2502
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mWEVI0SVVoYdbATnbcBU4G0wCEZdm0ZZL0lPTedbFI=;
 b=qwML8UM+lt+WzbZRxd/bKDXoLxqYicVVu7r45ggubvSpQRASDqfxImgia3TqdQyZSvWFd+sXSB0LX03ZXzDWko0PshX9m6fnEc3n1MTJY8JknAGru+ELbaZqD5tSkRfgRVeTTrxt0QocQHRdD3snXT6vFWUguXqyKd6oXRACrzU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzDQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+DQoNCkhhcnJ5DQoNCk9uIDIwMTktMDUtMjIgMTE6MTEgYS5tLiwgTmljaG9sYXMgS2F6
bGF1c2thcyB3cm90ZToNCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPiANCj4gW1doeV0N
Cj4gVGhlIGN1cnJlbnQgc3RhdGUgb24gdGhlIGNvbm5lY3RvciBpcyBxdWVyaWVkIHdoZW4gZ2V0
dGluZyB0aGUgbWF4IGJwYw0KPiByYXRoZXIgdGhhbiB0aGUgbmV3IHN0YXRlLiBUaGlzIG1lYW5z
IHRoYXQgYSBuZXcgbWF4IGJwYyB2YWx1ZSBjYW4gb25seQ0KPiBjdXJyZW50bHkgdGFrZSBlZmZl
Y3Qgb24gdGhlIGNvbW1pdCAqYWZ0ZXIqIGl0IGNoYW5nZXMuDQo+IA0KPiBUaGUgbmV3IHN0YXRl
IHNob3VsZCBiZSBwYXNzZWQgaW4gaW5zdGVhZC4NCj4gDQo+IFtIb3ddDQo+IFBhc3MgZG93biB0
aGUgZG1fc3RhdGUgYXMgZHJtIHN0YXRlIHRvIHdoZXJlIHdlIGRvIGNvbG9yIGRlcHRoIGxvb2t1
cC4NCj4gDQo+IFRoZSBwYXNzZWQgaW4gc3RhdGUgY2FuIHN0aWxsIGJlIE5VTEwgd2hlbiBjYWxs
ZWQgZnJvbQ0KPiBhbWRncHVfZG1fY29ubmVjdG9yX21vZGVfdmFsaWQsIHNvIG1ha2Ugc3VyZSB0
aGF0IHdlIGhhdmUgcmVhc29uYWJsZQ0KPiBkZWZhdWx0cyBpbiBwbGFjZS4gVGhhdCBzaG91bGQg
cHJvYmFibHkgYmUgYWRkcmVzc2VkIGF0IHNvbWUgcG9pbnQuDQo+IA0KPiBUaGlzIGNoYW5nZSBu
b3cgKGNvcnJlY3RseSkgY2F1c2VzIGEgbW9kZXNldCB0byBvY2N1ciB3aGVuIGNoYW5naW5nIHRo
ZQ0KPiBtYXggYnBjIGZvciBhIGNvbm5lY3Rvci4NCj4gDQo+IENjOiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4NCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVz
a2FzQGFtZC5jb20+DQo+IC0tLQ0KPiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIHwgMjYgKysrKysrKysrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IGluZGV4IGE3YTll
NGQ4MWExNy4uNTgwYzMyNDg5MWZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAgLTMwMzgsMTMgKzMwMzgsMTQg
QEAgc3RhdGljIHZvaWQgdXBkYXRlX3N0cmVhbV9zY2FsaW5nX3NldHRpbmdzKGNvbnN0IHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICptb2RlLA0KPiAgfQ0KPiANCj4gIHN0YXRpYyBlbnVtIGRjX2Nv
bG9yX2RlcHRoDQo+IC1jb252ZXJ0X2NvbG9yX2RlcHRoX2Zyb21fZGlzcGxheV9pbmZvKGNvbnN0
IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICtjb252ZXJ0X2NvbG9yX2RlcHRo
X2Zyb21fZGlzcGxheV9pbmZvKGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Is
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3Jfc3RhdGUgKnN0YXRlKQ0KPiAgew0KPiAgICAgICAgIHVpbnQzMl90IGJwYyA9
IDg7DQo+IA0KPiAgICAgICAgIC8qIFRPRE86IFVzZSBwYXNzZWQgaW4gc3RhdGUgaW5zdGVhZCBv
ZiB0aGUgY3VycmVudCBzdGF0ZS4gKi8NCj4gLSAgICAgICBpZiAoY29ubmVjdG9yLT5zdGF0ZSkg
ew0KPiAtICAgICAgICAgICAgICAgYnBjID0gY29ubmVjdG9yLT5zdGF0ZS0+bWF4X2JwYzsNCj4g
KyAgICAgICBpZiAoc3RhdGUpIHsNCj4gKyAgICAgICAgICAgICAgIGJwYyA9IHN0YXRlLT5tYXhf
YnBjOw0KPiAgICAgICAgICAgICAgICAgLyogUm91bmQgZG93biB0byB0aGUgbmVhcmVzdCBldmVu
IG51bWJlci4gKi8NCj4gICAgICAgICAgICAgICAgIGJwYyA9IGJwYyAtIChicGMgJiAxKTsNCj4g
ICAgICAgICB9DQo+IEBAIC0zMTY1LDExICszMTY2LDEyIEBAIHN0YXRpYyB2b2lkIGFkanVzdF9j
b2xvdXJfZGVwdGhfZnJvbV9kaXNwbGF5X2luZm8oc3RydWN0IGRjX2NydGNfdGltaW5nICp0aW1p
bmdfDQo+IA0KPiAgfQ0KPiANCj4gLXN0YXRpYyB2b2lkDQo+IC1maWxsX3N0cmVhbV9wcm9wZXJ0
aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZShzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0s
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlX2luLA0KPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpvbGRfc3RyZWFtKQ0KPiArc3RhdGljIHZvaWQgZmls
bF9zdHJlYW1fcHJvcGVydGllc19mcm9tX2RybV9kaXNwbGF5X21vZGUoDQo+ICsgICAgICAgc3Ry
dWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLA0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlX2luLA0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsDQo+ICsgICAgICAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3Rh
dGUgKmNvbm5lY3Rvcl9zdGF0ZSwNCj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0
YXRlICpvbGRfc3RyZWFtKQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBkY19jcnRjX3RpbWluZyAq
dGltaW5nX291dCA9ICZzdHJlYW0tPnRpbWluZzsNCj4gICAgICAgICBjb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfaW5mbyAqaW5mbyA9ICZjb25uZWN0b3ItPmRpc3BsYXlfaW5mbzsNCj4gQEAgLTMx
OTIsNyArMzE5NCw3IEBAIGZpbGxfc3RyZWFtX3Byb3BlcnRpZXNfZnJvbV9kcm1fZGlzcGxheV9t
b2RlKHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSwNCj4gDQo+ICAgICAgICAgdGltaW5n
X291dC0+dGltaW5nXzNkX2Zvcm1hdCA9IFRJTUlOR18zRF9GT1JNQVRfTk9ORTsNCj4gICAgICAg
ICB0aW1pbmdfb3V0LT5kaXNwbGF5X2NvbG9yX2RlcHRoID0gY29udmVydF9jb2xvcl9kZXB0aF9m
cm9tX2Rpc3BsYXlfaW5mbygNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdG9yKTsN
Cj4gKyAgICAgICAgICAgICAgIGNvbm5lY3RvciwgY29ubmVjdG9yX3N0YXRlKTsNCj4gICAgICAg
ICB0aW1pbmdfb3V0LT5zY2FuX3R5cGUgPSBTQ0FOTklOR19UWVBFX05PREFUQTsNCj4gICAgICAg
ICB0aW1pbmdfb3V0LT5oZG1pX3ZpYyA9IDA7DQo+IA0KPiBAQCAtMzM4OSw2ICszMzkxLDggQEAg
Y3JlYXRlX3N0cmVhbV9mb3Jfc2luayhzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5l
Y3RvciwNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqcHJlZmVycmVk
X21vZGUgPSBOVUxMOw0KPiAgICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpkcm1fY29ubmVj
dG9yOw0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25fc3Rh
dGUgPQ0KPiArICAgICAgICAgICAgICAgZG1fc3RhdGUgPyAmZG1fc3RhdGUtPmJhc2UgOiBOVUxM
Ow0KPiAgICAgICAgIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSA9IE5VTEw7DQo+ICAg
ICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgbW9kZSA9ICpkcm1fbW9kZTsNCj4gICAgICAg
ICBib29sIG5hdGl2ZV9tb2RlX2ZvdW5kID0gZmFsc2U7DQo+IEBAIC0zNDYxLDEwICszNDY1LDEw
IEBAIGNyZWF0ZV9zdHJlYW1fZm9yX3Npbmsoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFj
b25uZWN0b3IsDQo+ICAgICAgICAgKi8NCj4gICAgICAgICBpZiAoIXNjYWxlIHx8IG1vZGVfcmVm
cmVzaCAhPSBwcmVmZXJyZWRfcmVmcmVzaCkNCj4gICAgICAgICAgICAgICAgIGZpbGxfc3RyZWFt
X3Byb3BlcnRpZXNfZnJvbV9kcm1fZGlzcGxheV9tb2RlKHN0cmVhbSwNCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgJm1vZGUsICZhY29ubmVjdG9yLT5iYXNlLCBOVUxMKTsNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgJm1vZGUsICZhY29ubmVjdG9yLT5iYXNlLCBjb25fc3RhdGUsIE5VTEwp
Ow0KPiAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgIGZpbGxfc3RyZWFtX3Byb3BlcnRp
ZXNfZnJvbV9kcm1fZGlzcGxheV9tb2RlKHN0cmVhbSwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgJm1vZGUsICZhY29ubmVjdG9yLT5iYXNlLCBvbGRfc3RyZWFtKTsNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgJm1vZGUsICZhY29ubmVjdG9yLT5iYXNlLCBjb25fc3RhdGUsIG9sZF9zdHJl
YW0pOw0KPiANCj4gICAgICAgICB1cGRhdGVfc3RyZWFtX3NjYWxpbmdfc2V0dGluZ3MoJm1vZGUs
IGRtX3N0YXRlLCBzdHJlYW0pOw0KPiANCj4gLS0NCj4gMi4xNy4xDQo+IA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCj4gDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
