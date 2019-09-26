Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820EBFAF1
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 23:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5550A6EE0E;
	Thu, 26 Sep 2019 21:31:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710069.outbound.protection.outlook.com [40.107.71.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15E46EE0E
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 21:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd25SVwDe54olu8BtWdycdEV2skdBIPimGruLW1CY9WQ5AJWL1aIp2di8tkbepUPtFBCSW1TQTGDlh/wGmvwyIO3qeVHBCcUwYbN+3yEmIT4QUmuM+IcRrOx+oHBoL5inlScU6P/Xxa9E7zkyAkuubxKEUcC0Hbnerndi7ahCwy4rpc8nuGcCX07remmuvPt4C2c75ju3HEJWhoM3qx1YBLQEyFIN/w+P5jxvmLH9LaEHmkqWxXP/f1cPPCx1zQ7AAR+nMe5FJSrGSGPdbOmgJ7YzFlgMs6y4ML/thVU9hdnz5Hphsr4PA/jgC+0pDxr0UD8xcos63ojmVmnyE8sxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSOe2uFCjme87nnufEw+XfXWAM6B97X377Z5p3OiYfg=;
 b=N+cjChP1Iw/ReOznOHLVZY/D5Hp8fTIduIGPAU+I3VssgdIp8qI8COiaJ5KtbKoGYK0aSvj7Z5KBc1uMSWiq+aLWRzIdXYAlu47/9dbTQFFADxl14v5Sj/Zn6HkWQZej0Y5wwgY5ydK8lVV++8u/STt/Ve3gunYpNoFZWY4h0Ya6R7/oimecIVzyEksKv+XzPSxzGWhfxtyVTdofj5agb97nZSdkCTLy1R/aIJK+dSQSh4fTAkRETYlTUaY6facHxtuD5cRByL73uOUbxCih5quCScT64XCnX9ZvpsDQI7OcSfAYoo99qHz/f1sqJGeQ9JsvOYvBU/6dQVxefw/Mjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3420.namprd12.prod.outlook.com (20.178.198.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 21:31:40 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 21:31:40 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info for non HWS
Thread-Topic: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info for non HWS
Thread-Index: AQHVdLEv0HnAymZLjEq6UNj0CJLd7ac+eiwA
Date: Thu, 26 Sep 2019 21:31:39 +0000
Message-ID: <56a5fc99-0fd7-0194-a4e9-f533207adc6b@amd.com>
References: <20190926212640.28989-1-Yong.Zhao@amd.com>
 <20190926212640.28989-2-Yong.Zhao@amd.com>
In-Reply-To: <20190926212640.28989-2-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a662ed19-bd30-4c71-f41f-08d742c8eae8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3420:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3420EC8544E5DA38BB94120A92860@DM6PR12MB3420.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(189003)(199004)(25786009)(81166006)(186003)(3846002)(6116002)(2906002)(8936002)(8676002)(66066001)(86362001)(31696002)(7736002)(65806001)(65956001)(76176011)(2501003)(36756003)(81156014)(52116002)(305945005)(6506007)(386003)(99286004)(14454004)(53546011)(6486002)(316002)(6436002)(71190400001)(71200400001)(478600001)(31686004)(256004)(5660300002)(6512007)(66556008)(64756008)(476003)(66446008)(2616005)(66476007)(66946007)(446003)(11346002)(110136005)(58126008)(486006)(102836004)(6246003)(229853002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3420;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cwuboAF62rS2H619MciyRKiph/HMUh3578jEZ1Hzg3kBMFmdgTUdXjRXwJZQp/O+cIrR4JH9zKI2Vjp7RLLq7sldKKJHZpaSNH3QK1OWkBchgnku+vcTfknvNfXsjWeOjQ7ZbTle08uO2aepJqPOOw5hDS6A7UmimShGqsuashyoqy4b4idCIDeck1RxHWFh7zNAqRy0GfAZjkzKTalKBsKuJi9Qc46veEjXQ+w8BsvgpDKFNKFTAwck/cl2lmc7QG4TAt9fu4e4KLYXDIxT8bZZ7/1EMww+C8lna9qMNf/GJR2Tmcje+yGOZCj+/WpMVj4jkkSb+atJb8XMpczvb50NxU8aZTbUWyY6bCYqD37c7f3h7vZt8LgXH5Afx3XRFmz838BNp/TcKhuul9tbWusj/KqNPgy2JtbCZmfvht4=
Content-ID: <69F8043C07EECA4A95D87855B8745539@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a662ed19-bd30-4c71-f41f-08d742c8eae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 21:31:39.9501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T00LOeZPmQx0eYQEbKt2XmBwRHpVJjwDExTL/3NB14Uu56cmn6jIuFab7prQhsVyrqU6368xzyzke+pJWHcbjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3420
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSOe2uFCjme87nnufEw+XfXWAM6B97X377Z5p3OiYfg=;
 b=bnLTFh12p3cCKjKrrGZMX1oCnoyBoWo53VWkpJyK+AmglGMsfdgdhuZ5N3a6k0W9mXq/BxT6q75OkBfvnKNPizAyts3w7divrWA193zz+2wF5Jt+tt4qJvFJRe8td4U0Cow/GDOyWNJX0K30CfJTCSmcDyuUqHEg/uWPH/3Agig=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wOS0yNiA1OjI3IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+IEJlY2F1c2Ugd2Ug
cmVjb3JkIHRoZSBtYXBwaW5nIHVuZGVyIG5vbiBIV1MgbW9kZSBpbiB0aGUgc29mdHdhcmUsDQo+
IHdlIGNhbiBxdWVyeSBwYXNpZCB0aHJvdWdoIHZtaWQgdXNpbmcgdGhlIHN0b3JlZCBtYXBwaW5n
IGluc3RlYWQgb2YNCj4gcmVhZGluZyBmcm9tIEFUQyByZWdpc3RlcnMuDQo+DQo+IFRoaXMgYWxz
byBwcmVwYXJlcyBmb3IgdGhlIGRlZmVhdHVyZWQgQVRDIGJsb2NrIGluIGZ1dHVyZSBBU0lDcy4N
Cj4NCj4gQ2hhbmdlLUlkOiBJNzgxY2I5ZDMwZGMwY2M5MzM3OTkwOGZmMWNmOGRhNzk4YmIyNmYx
Mw0KPiBTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYyB8IDQg
KystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3By
b2Nlc3NfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192
OS5jDQo+IGluZGV4IGFiOGE2OTVjNGEzYy4uOWZmZjAxYzBmYjllIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYw0KPiBAQCAtNTgs
OCArNTgsOCBAQCBzdGF0aWMgYm9vbCBldmVudF9pbnRlcnJ1cHRfaXNyX3Y5KHN0cnVjdCBrZmRf
ZGV2ICpkZXYsDQo+ICAgCQltZW1jcHkocGF0Y2hlZF9paHJlLCBpaF9yaW5nX2VudHJ5LA0KPiAg
IAkJCQlkZXYtPmRldmljZV9pbmZvLT5paF9yaW5nX2VudHJ5X3NpemUpOw0KPiAgIA0KPiAtCQlw
YXNpZCA9IGRldi0+a2ZkMmtnZC0+Z2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfcGFzaWQoDQo+
IC0JCQkJZGV2LT5rZ2QsIHZtaWQpOw0KPiArCQlwYXNpZCA9IGRldi0+ZHFtLT52bWlkX3Bhc2lk
W3ZtaWRdOw0KPiArCQlXQVJOX09OQ0UocGFzaWQgPT0gMCwgIk5vIFBBU0lEIGFzc2lnbmVkIGZv
ciBWTUlEICVkXG4iLCB2bWlkKTsNCg0KV2hlbiB0aGlzIGhhcHBlbnMsIHlvdSdsbCBub3cgZ2V0
IHRvIFdBUk5fT05DRSBtZXNzYWdlcy4gT25lIGhlcmUgYW5kIA0KdGhlbiB0aGUgb25lIGEgZmV3
IGxpbmVzIGxvd2VyOiBXQVJOX09OQ0UocGFzaWQgPT0gMCwgIkJ1ZzogTm8gUEFTSUQgaW4gDQpL
RkQgaW50ZXJydXB0IikuIE15IHBvaW50IHdhcywgeW91ciBtZXNzYWdlcyBpcyByZWR1bmRhbnQu
IFRoZSBvcmlnaW5hbCANCldBUk5fT05DRSBhbHJlYWR5IGNvdmVycyBib3RoIHRoZSBIV1MgYW5k
IG5vbi1IV1MgY2FzZXMuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KPiAgIA0KPiAgIAkJLyog
UGF0Y2ggdGhlIHBhc2lkIGZpZWxkICovDQo+ICAgCQlwYXRjaGVkX2locmVbM10gPSBjcHVfdG9f
bGUzMigobGUzMl90b19jcHUocGF0Y2hlZF9paHJlWzNdKQ0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
