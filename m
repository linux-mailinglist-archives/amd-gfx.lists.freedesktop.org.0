Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B524C9F5F
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 15:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799746E9D1;
	Thu,  3 Oct 2019 13:27:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691DD6E9D1
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 13:27:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYIv7ZXwK88G6pAJrzVJmNLPw43Gh0TZaMi/yC++uSHHt3tk1o7hgqFXAr4FNdXmJI4qtdeLGJozEQ3w4jU1fCnkQ7hKlbHVbQYQX/i7dE2+eZOz9h37lBoIas1DM374xFfO57GN3sqAtlU3LvIFX+U6RZvt9BxxHCo3L4+P0kqjh16Hy48GiS/OmkVEbStMY2FZzyVBFzCClWkbLWE+47hcI/Tr/9PLBJA9GFTmDRnwGvREqd53Fp/cQh6zbCeIoMRRpxQu5BGTN0LoYbPsJ0M2yRE8LxXu8YC1RilD1bcAHgvKQxkG8/mtfvy+x1wNEKpasRYgq1DbhzOk6WfGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c63JxvEtv+eKVtHjmgbsuvcDzaevO8Y979WPnwgow9M=;
 b=RD/NQmM9iyLOvE5p/6iJsCOhXlc7ZIkF7Hl0+ls3BI0PT8Ve7aUyRav6v05Lmmg6Rj1iPIgmszw4c7EmiSYmBs02ZmvtU9dGm2t33wXm3ui78MKGsbVer0ocUUCB3DDRV5cQi8pPsp9lzERL9GxpKOqLpTXg4f5aS67xrmHBznrRCw7a1NHAqDg5McrdBKtkWAQKxup8vvDxekRcHob9vXC32ludFjvUgDDV0p6Wxkd5ka9/6WiZpwuMtijpJrvb7q+dyJq42Sszbyo2S1q7vUV3f4bHYGOAcoh6go9GD1+uBSKoiHrCORMGmzgsaQl8Dm4/ucz+kYPToP0/3cGeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0103.namprd12.prod.outlook.com (10.172.75.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 13:27:05 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 13:27:05 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Colin King <colin.king@canonical.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Liu,
 Wenjing" <Wenjing.Liu@amd.com>, "Lakha, Bhawanpreet"
 <Bhawanpreet.Lakha@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.or"
 <dri-devel@lists.freedesktop.or>
Subject: Re: [PATCH][drm-next] drm/amd/display: fix spelling mistake
 AUTHENICATED -> AUTHENTICATED
Thread-Topic: [PATCH][drm-next] drm/amd/display: fix spelling mistake
 AUTHENICATED -> AUTHENTICATED
Thread-Index: AQHVecO4vq3bkah5bkaEpAyF0agzTqdI6PEA
Date: Thu, 3 Oct 2019 13:27:05 +0000
Message-ID: <125634cd-b636-c4dc-4e05-bc5c543b7230@amd.com>
References: <20191003082232.4136-1-colin.king@canonical.com>
In-Reply-To: <20191003082232.4136-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [132.205.229.214]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YQXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::29) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0bf9b87-b835-4692-4cef-08d7480561d4
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0103:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0103F3F2CEBBE51CDE85FC4B8C9F0@CY4PR1201MB0103.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(189003)(199004)(486006)(2501003)(36756003)(99286004)(6116002)(2616005)(14444005)(4326008)(256004)(2201001)(476003)(31696002)(58126008)(7736002)(6512007)(305945005)(2906002)(14454004)(11346002)(446003)(5660300002)(3846002)(186003)(81156014)(229853002)(81166006)(8936002)(25786009)(26005)(6486002)(66446008)(64756008)(66556008)(66476007)(54906003)(316002)(8676002)(66946007)(6246003)(71200400001)(71190400001)(66066001)(65956001)(65806001)(52116002)(76176011)(31686004)(102836004)(110136005)(478600001)(6506007)(6436002)(386003)(53546011)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0103;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fu5iNh+kJ+vQNfpmvG4Pjjhf7otQZZPZHqS1Ka5kIFVuAjYkXsRu80UA6bn0/6suhbhHbegUdkdgI7h4tIY9Voc5Sd974Kfxgrtt8klAGo6i0mwzjlIHd/j+wLdXMnoz6oK0ZKhDbDiIrkpHnH/1ilB1UNh53qNVFaqu+f1i8uf0ve2EY+StiWBhFM2FZDQ96vFOsQ4O+xjuGNaB74iDwX9+rila1yv03Ew1sFgXc6KJhRv+kOjOE5KBEaqE4c1IVxmpLesrAxU18Z6rHoC5MDmodV+uQXcs21sSJwzVHod9iDGE5DgWVaCEq/7yij0Q+dGB27ofEUFv22MKZKnKgQEWmC3wNoCwF37uXdWnzcTenqiITBosPn4o9NqiVtVfrY2K1aUM6ho3PwclRTKFCKr9Td+wpwG+kqf2Kd83Gcs=
Content-ID: <66FA29DAD42AEE41BF81C0702495AFF9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bf9b87-b835-4692-4cef-08d7480561d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 13:27:05.2652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2f8ecgohj4nzs7zSh0u4D6ubllk2CeNN99xrs9/5hl4Sk5c26rnGpTWgIWVYpQcCs4YKGzC/tWF81qBxqyKMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c63JxvEtv+eKVtHjmgbsuvcDzaevO8Y979WPnwgow9M=;
 b=h3baExWrnampk2SXPGMR4vrAPjQU1fkjSnOt5lrTM4ZzSWvhQncs5wqY0ngq7xupapysNyCzl1N/RqZGiyk+8eWx2MtYXGcxKn89UFf8RK8ouWtEFYlvcNMecvUUc7M3NZ7c8cD3ilmei+Eo8vnooXoeRpaboXBIJLBxw4Xet9A=
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wMyA0OjIyIGEubS4sIENvbGluIEtpbmcgd3JvdGU6DQo+IEZyb206IENvbGlu
IElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IA0KPiBUaGVyZSBpcyBhIHNw
ZWxsaW5nIG1pc3Rha2UgaW4gdGhlIG1hY3JvcyBIMV9BNDVfQVVUSEVOSUNBVEVEIGFuZA0KPiBE
MV9BNF9BVVRIRU5JQ0FURUQsIGZpeCB0aGVzZSBieSBhZGRpbmcgdGhlIG1pc3NpbmcgVC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5j
b20+DQoNClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNv
bT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2hkY3AvaGRjcC5oICAgICAgfCAgNCArKy0tDQo+ICAuLi4vZHJtL2FtZC9kaXNwbGF5L21v
ZHVsZXMvaGRjcC9oZGNwMV9leGVjdXRpb24uYyAgIHwgIDQgKystLQ0KPiAgLi4uL2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfdHJhbnNpdGlvbi5jICB8IDEyICsrKysrKy0tLS0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX2xvZy5j
ICB8ICA4ICsrKystLS0tDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2hkY3AvaGRjcC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21v
ZHVsZXMvaGRjcC9oZGNwLmgNCj4gaW5kZXggNDAyYmI3OTk5MDkzLi41NjY0YmMwYjViZDAgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRj
cC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRj
cC5oDQo+IEBAIC0xNzYsNyArMTc2LDcgQEAgZW51bSBtb2RfaGRjcF9oZGNwMV9zdGF0ZV9pZCB7
DQo+ICAJSDFfQTBfV0FJVF9GT1JfQUNUSVZFX1JYLA0KPiAgCUgxX0ExX0VYQ0hBTkdFX0tTVlMs
DQo+ICAJSDFfQTJfQ09NUFVUQVRJT05TX0EzX1ZBTElEQVRFX1JYX0E2X1RFU1RfRk9SX1JFUEVB
VEVSLA0KPiAtCUgxX0E0NV9BVVRIRU5JQ0FURUQsDQo+ICsJSDFfQTQ1X0FVVEhFTlRJQ0FURUQs
DQo+ICAJSDFfQThfV0FJVF9GT1JfUkVBRFksDQo+ICAJSDFfQTlfUkVBRF9LU1ZfTElTVCwNCj4g
IAlIRENQMV9TVEFURV9FTkQgPSBIMV9BOV9SRUFEX0tTVl9MSVNUDQo+IEBAIC0xODgsNyArMTg4
LDcgQEAgZW51bSBtb2RfaGRjcF9oZGNwMV9kcF9zdGF0ZV9pZCB7DQo+ICAJRDFfQTFfRVhDSEFO
R0VfS1NWUywNCj4gIAlEMV9BMjNfV0FJVF9GT1JfUjBfUFJJTUUsDQo+ICAJRDFfQTJfQ09NUFVU
QVRJT05TX0EzX1ZBTElEQVRFX1JYX0E1X1RFU1RfRk9SX1JFUEVBVEVSLA0KPiAtCUQxX0E0X0FV
VEhFTklDQVRFRCwNCj4gKwlEMV9BNF9BVVRIRU5USUNBVEVELA0KPiAgCUQxX0E2X1dBSVRfRk9S
X1JFQURZLA0KPiAgCUQxX0E3X1JFQURfS1NWX0xJU1QsDQo+ICAJSERDUDFfRFBfU1RBVEVfRU5E
ID0gRDFfQTdfUkVBRF9LU1ZfTElTVCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfZXhlY3V0aW9uLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AxX2V4ZWN1dGlvbi5jDQo+IGluZGV4IDll
NzMwMmVhYzI5OS4uM2RiNGE3ZGE0MTRmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AxX2V4ZWN1dGlvbi5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfZXhlY3V0aW9uLmMNCj4g
QEAgLTQ3Niw3ICs0NzYsNyBAQCBlbnVtIG1vZF9oZGNwX3N0YXR1cyBtb2RfaGRjcF9oZGNwMV9l
eGVjdXRpb24oc3RydWN0IG1vZF9oZGNwICpoZGNwLA0KPiAgCQlzdGF0dXMgPSBjb21wdXRhdGlv
bnNfdmFsaWRhdGVfcnhfdGVzdF9mb3JfcmVwZWF0ZXIoaGRjcCwNCj4gIAkJCQlldmVudF9jdHgs
IGlucHV0KTsNCj4gIAkJYnJlYWs7DQo+IC0JY2FzZSBIMV9BNDVfQVVUSEVOSUNBVEVEOg0KPiAr
CWNhc2UgSDFfQTQ1X0FVVEhFTlRJQ0FURUQ6DQo+ICAJCXN0YXR1cyA9IGF1dGhlbnRpY2F0ZWQo
aGRjcCwgZXZlbnRfY3R4LCBpbnB1dCk7DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgSDFfQThfV0FJ
VF9GT1JfUkVBRFk6DQo+IEBAIC01MTMsNyArNTEzLDcgQEAgZXh0ZXJuIGVudW0gbW9kX2hkY3Bf
c3RhdHVzIG1vZF9oZGNwX2hkY3AxX2RwX2V4ZWN1dGlvbihzdHJ1Y3QgbW9kX2hkY3AgKmhkY3As
DQo+ICAJCXN0YXR1cyA9IGNvbXB1dGF0aW9uc192YWxpZGF0ZV9yeF90ZXN0X2Zvcl9yZXBlYXRl
cigNCj4gIAkJCQloZGNwLCBldmVudF9jdHgsIGlucHV0KTsNCj4gIAkJYnJlYWs7DQo+IC0JY2Fz
ZSBEMV9BNF9BVVRIRU5JQ0FURUQ6DQo+ICsJY2FzZSBEMV9BNF9BVVRIRU5USUNBVEVEOg0KPiAg
CQlzdGF0dXMgPSBhdXRoZW50aWNhdGVkX2RwKGhkY3AsIGV2ZW50X2N0eCwgaW5wdXQpOw0KPiAg
CQlicmVhazsNCj4gIAljYXNlIEQxX0E2X1dBSVRfRk9SX1JFQURZOg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwMV90cmFuc2l0aW9u
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AxX3RyYW5z
aXRpb24uYw0KPiBpbmRleCAxZDE4NzgwOWI3MDkuLjEzNmI4MDExZmYzZiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwMV90cmFuc2l0
aW9uLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9o
ZGNwMV90cmFuc2l0aW9uLmMNCj4gQEAgLTgxLDExICs4MSwxMSBAQCBlbnVtIG1vZF9oZGNwX3N0
YXR1cyBtb2RfaGRjcF9oZGNwMV90cmFuc2l0aW9uKHN0cnVjdCBtb2RfaGRjcCAqaGRjcCwNCj4g
IAkJCXNldF9zdGF0ZV9pZChoZGNwLCBvdXRwdXQsIEgxX0E4X1dBSVRfRk9SX1JFQURZKTsNCj4g
IAkJfSBlbHNlIHsNCj4gIAkJCWNhbGxiYWNrX2luX21zKDAsIG91dHB1dCk7DQo+IC0JCQlzZXRf
c3RhdGVfaWQoaGRjcCwgb3V0cHV0LCBIMV9BNDVfQVVUSEVOSUNBVEVEKTsNCj4gKwkJCXNldF9z
dGF0ZV9pZChoZGNwLCBvdXRwdXQsIEgxX0E0NV9BVVRIRU5USUNBVEVEKTsNCj4gIAkJCUhEQ1Bf
RlVMTF9ERENfVFJBQ0UoaGRjcCk7DQo+ICAJCX0NCj4gIAkJYnJlYWs7DQo+IC0JY2FzZSBIMV9B
NDVfQVVUSEVOSUNBVEVEOg0KPiArCWNhc2UgSDFfQTQ1X0FVVEhFTlRJQ0FURUQ6DQo+ICAJCWlm
IChpbnB1dC0+bGlua19tYWludGVuYW5jZSAhPSBQQVNTKSB7DQo+ICAJCQkvKiAxQS0wNzogY29u
c2lkZXIgaW52YWxpZCByaScgYSBmYWlsdXJlICovDQo+ICAJCQkvKiAxQS0wN2E6IGNvbnNpZGVy
IHJlYWQgcmknIG5vdCByZXR1cm5lZCBhIGZhaWx1cmUgKi8NCj4gQEAgLTEyOSw3ICsxMjksNyBA
QCBlbnVtIG1vZF9oZGNwX3N0YXR1cyBtb2RfaGRjcF9oZGNwMV90cmFuc2l0aW9uKHN0cnVjdCBt
b2RfaGRjcCAqaGRjcCwNCj4gIAkJCWJyZWFrOw0KPiAgCQl9DQo+ICAJCWNhbGxiYWNrX2luX21z
KDAsIG91dHB1dCk7DQo+IC0JCXNldF9zdGF0ZV9pZChoZGNwLCBvdXRwdXQsIEgxX0E0NV9BVVRI
RU5JQ0FURUQpOw0KPiArCQlzZXRfc3RhdGVfaWQoaGRjcCwgb3V0cHV0LCBIMV9BNDVfQVVUSEVO
VElDQVRFRCk7DQo+ICAJCUhEQ1BfRlVMTF9ERENfVFJBQ0UoaGRjcCk7DQo+ICAJCWJyZWFrOw0K
PiAgCWRlZmF1bHQ6DQo+IEBAIC0yMjQsMTEgKzIyNCwxMSBAQCBlbnVtIG1vZF9oZGNwX3N0YXR1
cyBtb2RfaGRjcF9oZGNwMV9kcF90cmFuc2l0aW9uKHN0cnVjdCBtb2RfaGRjcCAqaGRjcCwNCj4g
IAkJCXNldF93YXRjaGRvZ19pbl9tcyhoZGNwLCA1MDAwLCBvdXRwdXQpOw0KPiAgCQkJc2V0X3N0
YXRlX2lkKGhkY3AsIG91dHB1dCwgRDFfQTZfV0FJVF9GT1JfUkVBRFkpOw0KPiAgCQl9IGVsc2Ug
ew0KPiAtCQkJc2V0X3N0YXRlX2lkKGhkY3AsIG91dHB1dCwgRDFfQTRfQVVUSEVOSUNBVEVEKTsN
Cj4gKwkJCXNldF9zdGF0ZV9pZChoZGNwLCBvdXRwdXQsIEQxX0E0X0FVVEhFTlRJQ0FURUQpOw0K
PiAgCQkJSERDUF9GVUxMX0REQ19UUkFDRShoZGNwKTsNCj4gIAkJfQ0KPiAgCQlicmVhazsNCj4g
LQljYXNlIEQxX0E0X0FVVEhFTklDQVRFRDoNCj4gKwljYXNlIEQxX0E0X0FVVEhFTlRJQ0FURUQ6
DQo+ICAJCWlmIChpbnB1dC0+bGlua19pbnRlZ2lyeV9jaGVjayAhPSBQQVNTIHx8DQo+ICAJCQkJ
aW5wdXQtPnJlYXV0aF9yZXF1ZXN0X2NoZWNrICE9IFBBU1MpIHsNCj4gIAkJCS8qIDFBLTA3OiBy
ZXN0YXJ0IGhkY3Agb24gYSBsaW5rIGludGVncml0eSBmYWlsdXJlICovDQo+IEBAIC0yOTUsNyAr
Mjk1LDcgQEAgZW51bSBtb2RfaGRjcF9zdGF0dXMgbW9kX2hkY3BfaGRjcDFfZHBfdHJhbnNpdGlv
bihzdHJ1Y3QgbW9kX2hkY3AgKmhkY3AsDQo+ICAJCQlmYWlsX2FuZF9yZXN0YXJ0X2luX21zKDAs
ICZzdGF0dXMsIG91dHB1dCk7DQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiAtCQlzZXRfc3RhdGVf
aWQoaGRjcCwgb3V0cHV0LCBEMV9BNF9BVVRIRU5JQ0FURUQpOw0KPiArCQlzZXRfc3RhdGVfaWQo
aGRjcCwgb3V0cHV0LCBEMV9BNF9BVVRIRU5USUNBVEVEKTsNCj4gIAkJSERDUF9GVUxMX0REQ19U
UkFDRShoZGNwKTsNCj4gIAkJYnJlYWs7DQo+ICAJZGVmYXVsdDoNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9sb2cuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9sb2cuYw0KPiBpbmRleCBk
ODY4ZjU1NmQxODAuLjM5ODJjZWQ1Zjk2OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX2xvZy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9sb2cuYw0KPiBAQCAtMTM2LDggKzEz
Niw4IEBAIGNoYXIgKm1vZF9oZGNwX3N0YXRlX2lkX3RvX3N0cihpbnQzMl90IGlkKQ0KPiAgCQly
ZXR1cm4gIkgxX0ExX0VYQ0hBTkdFX0tTVlMiOw0KPiAgCWNhc2UgSDFfQTJfQ09NUFVUQVRJT05T
X0EzX1ZBTElEQVRFX1JYX0E2X1RFU1RfRk9SX1JFUEVBVEVSOg0KPiAgCQlyZXR1cm4gIkgxX0Ey
X0NPTVBVVEFUSU9OU19BM19WQUxJREFURV9SWF9BNl9URVNUX0ZPUl9SRVBFQVRFUiI7DQo+IC0J
Y2FzZSBIMV9BNDVfQVVUSEVOSUNBVEVEOg0KPiAtCQlyZXR1cm4gIkgxX0E0NV9BVVRIRU5JQ0FU
RUQiOw0KPiArCWNhc2UgSDFfQTQ1X0FVVEhFTlRJQ0FURUQ6DQo+ICsJCXJldHVybiAiSDFfQTQ1
X0FVVEhFTlRJQ0FURUQiOw0KPiAgCWNhc2UgSDFfQThfV0FJVF9GT1JfUkVBRFk6DQo+ICAJCXJl
dHVybiAiSDFfQThfV0FJVF9GT1JfUkVBRFkiOw0KPiAgCWNhc2UgSDFfQTlfUkVBRF9LU1ZfTElT
VDoNCj4gQEAgLTE1MCw4ICsxNTAsOCBAQCBjaGFyICptb2RfaGRjcF9zdGF0ZV9pZF90b19zdHIo
aW50MzJfdCBpZCkNCj4gIAkJcmV0dXJuICJEMV9BMjNfV0FJVF9GT1JfUjBfUFJJTUUiOw0KPiAg
CWNhc2UgRDFfQTJfQ09NUFVUQVRJT05TX0EzX1ZBTElEQVRFX1JYX0E1X1RFU1RfRk9SX1JFUEVB
VEVSOg0KPiAgCQlyZXR1cm4gIkQxX0EyX0NPTVBVVEFUSU9OU19BM19WQUxJREFURV9SWF9BNV9U
RVNUX0ZPUl9SRVBFQVRFUiI7DQo+IC0JY2FzZSBEMV9BNF9BVVRIRU5JQ0FURUQ6DQo+IC0JCXJl
dHVybiAiRDFfQTRfQVVUSEVOSUNBVEVEIjsNCj4gKwljYXNlIEQxX0E0X0FVVEhFTlRJQ0FURUQ6
DQo+ICsJCXJldHVybiAiRDFfQTRfQVVUSEVOVElDQVRFRCI7DQo+ICAJY2FzZSBEMV9BNl9XQUlU
X0ZPUl9SRUFEWToNCj4gIAkJcmV0dXJuICJEMV9BNl9XQUlUX0ZPUl9SRUFEWSI7DQo+ICAJY2Fz
ZSBEMV9BN19SRUFEX0tTVl9MSVNUOg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
