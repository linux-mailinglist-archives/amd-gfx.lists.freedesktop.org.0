Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E645538BAC
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 15:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532CE8954A;
	Fri,  7 Jun 2019 13:31:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790047.outbound.protection.outlook.com [40.107.79.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0088954A
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 13:31:43 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2501.namprd12.prod.outlook.com (10.172.117.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 13:31:42 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::3483:c2af:d182:555b]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::3483:c2af:d182:555b%6]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 13:31:42 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Use current connector state if NULL when
 checking bpc
Thread-Topic: [PATCH] drm/amd/display: Use current connector state if NULL
 when checking bpc
Thread-Index: AQHVG7yA+F5ctGYgf0uV/dUD9u29aqaQMwQA
Date: Fri, 7 Jun 2019 13:31:42 +0000
Message-ID: <5bef8352-f9f1-6709-0f7e-4ac3924652bb@amd.com>
References: <20190605163359.19422-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190605163359.19422-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e31a48f9-d615-4718-b3d5-08d6eb4c7a02
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2501; 
x-ms-traffictypediagnostic: CY4PR1201MB2501:
x-microsoft-antispam-prvs: <CY4PR1201MB2501D92A9B34339631D03C9F8C100@CY4PR1201MB2501.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(366004)(189003)(199004)(3846002)(6116002)(486006)(25786009)(65826007)(31686004)(476003)(64756008)(66446008)(7736002)(31696002)(72206003)(4326008)(305945005)(26005)(2906002)(478600001)(186003)(73956011)(81166006)(66946007)(81156014)(66476007)(8936002)(68736007)(8676002)(64126003)(6486002)(6512007)(66556008)(11346002)(446003)(229853002)(36756003)(386003)(52116002)(99286004)(102836004)(76176011)(2501003)(316002)(2616005)(6246003)(65956001)(65806001)(66066001)(71190400001)(256004)(71200400001)(5660300002)(14454004)(58126008)(6436002)(53546011)(6506007)(53936002)(110136005)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2501;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MQLws5W85EV7TeExYbNGDDbpVPJ7SpzCDo7TS4AEHYIHqKAK0Z2tCRIk+AHRoCNl0Y+prUoJMhJrkVMbY0Q/B+QHwi9tbQ8d9bjD4AZlRDF7tZTKzG7H6Vnxl9k45rM8UFACP3/DjWnnqYazR69CocrWjYYAlX1LvkHes/ke/sZfFEbOCZ3ucEgIPXhUcoIeH23i87n6jNns04BVZOSNLqJl3reyDAc7KSpg0cW5YlRWVgaiWzil915jCSueHoFjGKaogvTtGjxGxLPZPcs5hUCxsrl0JFBOO0ODXbjveA0sUxGQJ0KMaP1C+sKud6YIz6kLoLkHf70MUGEECIEpLBuBfyU2o0BzsX2HykgFS/7W+q+J1mKcoDPulyCU2vuvT9LX9qGMw060k0W9wHlmlWwDi9Tag2XE6UIrnWqxx9g=
Content-ID: <E48817459035494681F70148F0D49F3D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31a48f9-d615-4718-b3d5-08d6eb4c7a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 13:31:42.0756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sonGhaoxAVUm2Dw6FFfUace2jz9yxwffpjyCmYlV+tY=;
 b=cq7OGHx5HJS15NlqOEFfTCq7PU0All1B2LxCu1efNaTUN8DumyP79+cPh6zot4N224RVm4UYw8tFgxpke+VnEY7q7FooQALcwLFkQ2HAOOHygMXEqHGt02rl45sd8SLojC1vU8DsOD7+WEOz4uxbDZzrm0I/Cs5j05CAgGy1PHA=
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

T24gMjAxOS0wNi0wNSAxMjozMyBwLm0uLCBOaWNob2xhcyBLYXpsYXVza2FzIHdyb3RlOg0KPiBb
V2h5XQ0KPiBUaGUgb2xkIGxvZ2ljIGZvciBjaGVja2luZyB3aGljaCBvdXRwdXQgZGVwdGggdG8g
dXNlIHJlbGllZCBvbiB1c2luZw0KPiB0aGUgY3VycmVudCBjb25uZWN0b3Igc3RhdGUgcmF0aGVy
IHRoYW4gdGhlIG5ldyBwcm9wb3NlZCBzdGF0ZS4gVGhpcw0KPiB3YXMgYSBwcm9ibGVtIHdoZW4g
cGVyZm9ybWluZyBhdG9taWMgY29tbWl0cyBzaW5jZSB3ZSB3ZXJlbid0IHZlcmlmeWluZw0KPiBp
dCBhZ2FpbnN0IHRoZSBpbmNvbWluZyBtYXhfcmVxdWVzdGVkX2JwYy4NCj4gDQo+IEJ1dCBzd2l0
Y2hpbmcgdGhpcyB0byBvbmx5IHVzZSB0aGUgbmV3IHN0YXRlIGFuZCBub3QgdGhlIGN1cnJlbnQg
c3RhdGUNCj4gYnJlYWtzIGZpbHRlcmluZyBtb2RlcyAtIGl0J2xsIGFsd2F5cyBhc3N1bWUgdGhh
dCB0aGUgbWF4aW11bSBicGMNCj4gc3VwcG9ydGVkIGJ5IHRoZSBkaXNwbGF5IGlzIGluIHVzZSwg
d2hpY2ggd2lsbCBjYXVzZSBjZXJ0YWluIG1vZGVzDQo+IGxpa2UgMTQ0MHBAMTQ0SHogdG8gYmUg
ZmlsdGVyZWQgZXZlbiB3aGVuIHVzaW5nIDhicGMuDQo+IA0KPiBbSG93XQ0KPiBTdGlsbCB1c2Ug
dGhlIGNvbm5lY3Rvci0+c3RhdGUgaWYgd2UgYXJlbid0IHBhc3NlZCBhbiBleHBsaWNpdCBzdGF0
ZS4NCj4gVGhpcyB3aWxsIHJlc3BlY3QgdGhlIG1heF9icGMgdGhlIHVzZXIgY3VycmVudGx5IGhh
cyB3aGVuIGZpbHRlcmluZw0KPiBtb2Rlcy4NCj4gDQo+IEFsc28gcmVtZW1iZXIgdG8gcmVzZXQg
dGhlIGRlZmF1bHQgbWF4X3JlcXVlc3RlZF9icGMgdG8gOCB3aGVuZXZlcg0KPiBjb25uZWN0b3Ig
cmVzZXQgaXMgY2FsbGVkIHRvIHJldGFpbiBvbGQgYmVoYXZpb3Igd2hlbiB1c2luZyB0aGUgbmV3
DQo+IHByb3BlcnR5Lg0KPiANCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBh
bWQuY29tPg0KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpI
YXJyeQ0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyB8IDQgKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jDQo+IGluZGV4IGE2OThjOGYyNzJlZC4uZjYyN2MxN2ExMDM5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4g
QEAgLTMwNDYsNiArMzA0Niw5IEBAIGNvbnZlcnRfY29sb3JfZGVwdGhfZnJvbV9kaXNwbGF5X2lu
Zm8oY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gIHsNCj4gIAl1aW50
MzJfdCBicGMgPSBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGM7DQo+ICANCj4gKwlpZiAoIXN0
YXRlKQ0KPiArCQlzdGF0ZSA9IGNvbm5lY3Rvci0+c3RhdGU7DQo+ICsNCj4gIAlpZiAoc3RhdGUp
IHsNCj4gIAkJYnBjID0gc3RhdGUtPm1heF9icGM7DQo+ICAJCS8qIFJvdW5kIGRvd24gdG8gdGhl
IG5lYXJlc3QgZXZlbiBudW1iZXIuICovDQo+IEBAIC0zODIwLDYgKzM4MjMsNyBAQCB2b2lkIGFt
ZGdwdV9kbV9jb25uZWN0b3JfZnVuY3NfcmVzZXQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikNCj4gIAkJc3RhdGUtPnVuZGVyc2Nhbl9lbmFibGUgPSBmYWxzZTsNCj4gIAkJc3RhdGUt
PnVuZGVyc2Nhbl9oYm9yZGVyID0gMDsNCj4gIAkJc3RhdGUtPnVuZGVyc2Nhbl92Ym9yZGVyID0g
MDsNCj4gKwkJc3RhdGUtPmJhc2UubWF4X3JlcXVlc3RlZF9icGMgPSA4Ow0KPiAgDQo+ICAJCV9f
ZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0KGNvbm5lY3RvciwgJnN0YXRlLT5iYXNl
KTsNCj4gIAl9DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
