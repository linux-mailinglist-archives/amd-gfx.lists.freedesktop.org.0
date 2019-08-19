Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A3391D9C
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 09:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEA26E09A;
	Mon, 19 Aug 2019 07:14:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe42::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94D38910A
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 07:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9iVE08VOLG6WbrWhw16FDOSh2S4c6V7o8mWzSp1o+jM9xd3JkJrz7kRYY2sjumhNFKkomWuD3naiOUgUixEWhMu+mcZALbTZ9yE2I7m+d/+3U1e5Su4cHD5bfwCS+sqamrMZJ75tmGXZSwiPLKoG9dE/Azb0wilmc3tXjj36YI48DJuHmIr7kVuOCf8Pe7OudUeWPmr7zBi2BVXZiY/tkJVK4kNq/gVgbe416RbN4NJvI8+Zl+h+fvL1SSHHWob7ryEuEdvegsZ2VIXn7ehCTxOjrlVnR1QP6JW+Y8KimqWi0w1KsG5Z2TPATCaUe+lyaJblsSVil9nUi9h1Zsxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYflVHcLjDsdBDBq/LYmR5zxq1bY9UQNFh00Or9bAi0=;
 b=LgMC5cLtpYGGkKEWJLIwqYR4uW9U56XnAqaXlIDm45RZ/a+JgUKxm2QXGk7UDhkcHA69gSSU0jg52QSC0zs0Pzxlxg7jx+pfTlZvt/WlM4nc0pDJ39BE8BtsfRJ4PSPar2ODpbCx9/f1/adPkTczYai6BVh9ji3hPPZHPrK28mrkdUHRvhhCamfYeZVRoRfUyMeJrQstrYY05zHxx8mVA1E28eq1uoslqkPRKt/wUO82MruUyfvdfmz5GTR7+yO/G6UrJa/WKXgarJEgtRrHIZD1hmKWJiNbMQG8/crfJbG9RIweT3ri3vjDq/7bAUdFxjj+1bqPTI4wbJOI51YzHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2438.namprd12.prod.outlook.com (52.132.141.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 07:14:10 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 07:14:10 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Cui, Flora" <Flora.Cui@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>
Subject: Re: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Thread-Topic: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Thread-Index: AQHVVCJkTXF7fKGGD0y9yrf7bEc/4Kb9np0AgAQvmsCAAETggA==
Date: Mon, 19 Aug 2019 07:14:10 +0000
Message-ID: <59701e8a-cc27-95d7-97f3-2d5867d0bc40@amd.com>
References: <20190816110401.11069-1-guchun.chen@amd.com>
 <b6cde318-e453-8a89-095c-69708f0981ef@gmail.com>
 <BYAPR12MB280662C3A47CA31DC1790A3AF1A80@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB280662C3A47CA31DC1790A3AF1A80@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: LNXP265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::16) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23f0076f-5cc3-4e2c-245d-08d72474d49d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2438; 
x-ms-traffictypediagnostic: DM5PR12MB2438:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2438A0BB4880C82ABCCB8E8D83A80@DM5PR12MB2438.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(13464003)(199004)(189003)(229853002)(6512007)(486006)(46003)(25786009)(31686004)(11346002)(65956001)(186003)(305945005)(31696002)(65806001)(36756003)(2501003)(65826007)(7736002)(64126003)(86362001)(6486002)(6436002)(2616005)(66574012)(53936002)(6116002)(478600001)(110136005)(256004)(476003)(316002)(6636002)(81156014)(99286004)(71190400001)(71200400001)(446003)(2906002)(102836004)(8936002)(4326008)(66556008)(64756008)(14454004)(66946007)(66476007)(66446008)(81166006)(5660300002)(53546011)(6246003)(386003)(6506007)(76176011)(58126008)(52116002)(8676002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2438;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +PBIkHhpkWmiXn6+JFNN/C8kEdIKyF2ic3D5LcWe4IueLEQxF8NdLr666s+mWJJ1EbrO31ZRJBiMQxbwqtciV43/NHJyE6y+jT1WmmOlIiOYDEZJBVgN5f4D5r/NqImJvac+b4kCwfwFatHMZRC9QbBYuoeUxgbZLejqjNLgi1ThUF48Y+aoVHKi2lwOXqyIUcv8rrY+11lQC4dHTnES60AyfK6PWw5xeomzLlcFSPaJQDmB8bAnXHltyGPQcLo8vTxf9Cgaq6/L2XdcofosqPTY6aJ7UoILXKq0B2V9IfprJkr3kHBY2hI5PpwkNy2bhK7UhGhk1RlOK+bxq3dOyPXSpCXQqYzRs6BO7Po8inO3o9spC563faj9QOy18/kwTvzmTnwZGHrACWBUxcUcbkpi2ITGS8qBdG74EwIp5tE=
Content-ID: <A2A63A465C78504C9634E8326EEDB0F9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f0076f-5cc3-4e2c-245d-08d72474d49d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 07:14:10.1047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2XiJ+26hPJUZGL7Mz5jZiTgn5CJ9cmyONhLPagI9uSntTVVZ5G81DGsEOhIX5xG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2438
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYflVHcLjDsdBDBq/LYmR5zxq1bY9UQNFh00Or9bAi0=;
 b=brKca0JTxtnnSdCKR62wfNUtF69Jzp8OXU0xUumdLpQCzu9Ux5asif3qz/NcAXB/guvd4iAM+jOJxq2Jjs8lqg25YtkeavniHZfhHYiGADLj98DQG6j2l8om1d2k5EpaVtvxTKqAcY8MRFtoOOFOnTmxcGwwC27taIYGlKT0GtQ=
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
Cc: "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgR3VjaHVuLA0KDQppbiB0aGlzIGNhc2UgdGhpcyBpcyBhIGJpdCBhd2t3YXJkIGltcGxlbWVu
dGVkLg0KDQpTZWUgdGhlIGZpbGVzIGluIHRoZSBkYXRhIGRpcmVjdG9yeSBhcmUgZm9yIGluc3Rh
bGxhdGlvbiB0b2dldGhlciB3aXRoIA0KdGhlIGxpYmRybSBsaWJyYXJ5IGFuZCBOT1QgZm9yIHRo
ZSB1bml0IHRlc3RzLiBQbGVhc2UgbW92ZSB0aGUgZmlsZSB0byANCnRlc3RzL2FtZGdwdSBpbnN0
ZWFkLg0KDQpJIHdvdWxkIGFsc28gcmUtY29uc2lkZXIgdGhpcyBhcHByb2FjaCBzaW5jZSB3ZSBp
bnRlbnRpb25hbGx5IHVzZSB0aGUgDQpDVW5pdCBmcmFtZXdvcmsgdG8gYXZvaWQgZGVwZW5kZW5j
aWVzIG9uIGV4dGVybmFsIGxpYnJhcmllcyBsaWtlIGpzb24gDQphbmQgZXh0ZXJuYWwgZmlsZXMu
DQoNCldlIHNob3VsZCBwcm9iYWJseSBiZXR0ZXIgY29uZmlndXJlIHRoZSB0ZXN0cyBkaXJlY3Rs
eSBpbiB0aGUgQyBjb2RlIHNvIA0KdGhhdCB0aGUgdW5pdCB0ZXN0IHN0YXlzIHNlbGYgY29udGFp
bmluZy4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQW0gMTkuMDguMTkgdW0gMDU6MTYgc2No
cmllYiBDaGVuLCBHdWNodW46DQo+IEhpIENocmlzdGlhbiwNCj4NCj4gWWVzLCB3ZSBhZGRlZCBv
bmUgY29uZmlndXJhdGlvbiBmaWxlIG5hbWVkICJhbWRncHVfcmFzLmpzb24iIGZvciBSQVMgaW5q
ZWN0IHVuaXQgdGVzdCB0byBkcm0gbWFzdGVyIGJyYW5jaC4NCj4gVGhpcyB1bml0IHRlc3Qgd2ls
bCBiZSBtYWludGFpbmVkIHRvIGlsbHVzdHJhdGUgYWxsIHRoZSBSQVMgdGVzdHMgd2UgYWJzb2x1
dGVseSBzdXBwb3J0IGluIElQIG1vZHVsZXMvc3VibW9kdWxlcy4NCj4NCj4gUmVnYXJkcywNCj4g
R3VjaHVuDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENocmlzdGlh
biBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPiBTZW50OiBGcmlk
YXksIEF1Z3VzdCAxNiwgMjAxOSA3OjEyIFBNDQo+IFRvOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5D
aGVuQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEhhd2tp
bmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IExpLCBEZW5uaXMgPERlbm5pcy5MaUBhbWQuY29t
PjsgQ3VpLCBGbG9yYSA8RmxvcmEuQ3VpQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFA
YW1kLmNvbT4NCj4gQ2M6IExpLCBDYW5kaWNlIDxDYW5kaWNlLkxpQGFtZC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggbGliZHJtXSBhbWRncHU6IGFkZCBtbWh1YiByYXMgaW5qZWN0IHVuaXQg
dGVzdA0KPg0KPiBXZWxsIHRoaXMgZG9lc24ndCBsb29rIGxpa2UgQyB0byBtZS4gRGlkIHdlIGFk
ZGVkIGEgY29uZmlndXJhdGlvbiBmaWxlIGZvciB0aGUgcmFzIHVuaXQgdGVzdHMgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdD8NCj4NCj4gQ2hyaXN0aWFuLg0KPg0KPiBBbSAxNi4wOC4xOSB1bSAxMzow
NCBzY2hyaWViIEd1Y2h1biBDaGVuOg0KPj4gQ2hhbmdlLUlkOiBJYTc2Yjk1MTYyZjVmNmY0MTlm
NzBiNTNlZjQ0M2JjZWFmMmUwOTJlMA0KPj4gU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4gPGd1
Y2h1bi5jaGVuQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgIGRhdGEvYW1kZ3B1X3Jhcy5qc29uIHwg
MTAgKysrKysrKysrKw0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvZGF0YS9hbWRncHVfcmFzLmpzb24gYi9kYXRhL2FtZGdwdV9yYXMu
anNvbiBpbmRleA0KPj4gMjZmZDk0NjUuLjQ4NGYxMmYyIDEwMDY0NA0KPj4gLS0tIGEvZGF0YS9h
bWRncHVfcmFzLmpzb24NCj4+ICsrKyBiL2RhdGEvYW1kZ3B1X3Jhcy5qc29uDQo+PiBAQCAtMTIx
LDYgKzEyMSw5IEBADQo+PiAgICAgICAgICAgICAgICAgICAgInV0Y19hdGNsMl9jYWNoZV80a19i
YW5rIjogMTExDQo+PiAgICAgICAgICAgICAgICB9DQo+PiAgICAgICAgICAgIH0sDQo+PiArICAg
ICAgICAibW1odWIiOiB7DQo+PiArICAgICAgICAgICAgImluZGV4IjogMw0KPj4gKyAgICAgICAg
fSwNCj4+ICAgICAgICB9LA0KPj4gICAgICAgICJ0eXBlIjogew0KPj4gICAgICAgICAgICAicGFy
aXR5IjogMSwNCj4+IEBAIC0yNjMsNSArMjY2LDEyIEBADQo+PiAgICAgICAgICAgICAgICAiYWRk
cmVzcyI6IDAsDQo+PiAgICAgICAgICAgICAgICAidmFsdWUiOiAwDQo+PiAgICAgICAgICAgIH0s
DQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgIm5hbWUiOiAicmFzX21taHViLjEuMCIs
DQo+PiArICAgICAgICAgICAgImJsb2NrIjogIm1taHViIiwNCj4+ICsgICAgICAgICAgICAidHlw
ZSI6ICJzaW5nbGVfY29ycmVjdGFibGUiLA0KPj4gKyAgICAgICAgICAgICJhZGRyZXNzIjogMCwN
Cj4+ICsgICAgICAgICAgICAidmFsdWUiOiAwDQo+PiArICAgICAgICB9LA0KPj4gICAgICAgIF0N
Cj4+ICAgIH0NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
