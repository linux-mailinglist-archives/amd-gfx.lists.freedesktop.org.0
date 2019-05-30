Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666F2FFD5
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 18:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BDC6E384;
	Thu, 30 May 2019 16:01:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820083.outbound.protection.outlook.com [40.107.82.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46A26E384
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 16:01:16 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0198.namprd12.prod.outlook.com (10.172.75.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.22; Thu, 30 May 2019 16:01:15 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 16:01:15 +0000
From: Harry Wentland <hwentlan@amd.com>
To: =?utf-8?B?R2HDq2wgSEVSTUVU?= <linuzel@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: RX 580 and 5K displays, bandwidth validation failed whith
 multiple monitors
Thread-Topic: RX 580 and 5K displays, bandwidth validation failed whith
 multiple monitors
Thread-Index: AQHVFV790ZfaBuK8pkS9h7TgBYLSLqaD1ucA
Date: Thu, 30 May 2019 16:01:14 +0000
Message-ID: <c1f8b7b0-ad49-81cb-a304-ba7193913cc8@amd.com>
References: <1558969130.2.0@gmail.com>
In-Reply-To: <1558969130.2.0@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fed52998-23d9-4f90-057a-08d6e5180b08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0198; 
x-ms-traffictypediagnostic: CY4PR1201MB0198:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB01982588780163618DA28DB88C180@CY4PR1201MB0198.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(376002)(346002)(136003)(199004)(189003)(53546011)(76176011)(25786009)(52116002)(110136005)(64756008)(36756003)(58126008)(53936002)(66476007)(66556008)(66946007)(66446008)(73956011)(71200400001)(229853002)(11346002)(6486002)(446003)(99286004)(316002)(2616005)(31696002)(65826007)(6246003)(72206003)(478600001)(65956001)(102836004)(66066001)(6506007)(386003)(6116002)(256004)(966005)(8936002)(2906002)(8676002)(5660300002)(65806001)(3846002)(71190400001)(6306002)(6512007)(81166006)(486006)(186003)(68736007)(476003)(7736002)(2501003)(31686004)(81156014)(64126003)(26005)(14444005)(305945005)(14454004)(6436002)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0198;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZhUN2C0ZxbaxiRg6Fu/gNKOywRRw7/AxHSwVHP0tltWdnvIlJmHszqRfqvQz7XmAlMzNsmJn1xieK4rZApeVsZrDs8SHmgaE+/qZEsZIrqp5yIVouJ+A1Ivsoq2pN0Ut+C+XqlFLUzTuhm4mQDi0Lhr1sjX1Xk47ztGnlosQ1frNqMNe1QhSSbDVbtggLg8vxQCwex+QwgX11dP6Gvah+2kspB1x6uoDqTtNbzNFzqCF0xgkob3jBdbxeKhduXy6pjxV3IGREIpNN83vPytx4rOnxLvJwjYyUmE8yw1VopJPBJGMZj95urg7xlDkl5oDcc6GsRL624nkuJ1BisjcWia1bUr51+0Xt3XYIz4+oY66VGNUtOVG2dsg9a7nySJSG0MJIhE/zZov8BDw4oWOyzRRLHLGFYXHu73x/21A43k=
Content-ID: <A8710D87EF08884EB049FEC708320C4C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed52998-23d9-4f90-057a-08d6e5180b08
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 16:01:14.9637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0198
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNApUIQvX+O+6C5LXEtL81LmVD6TiKlbMJUPAXFS2cU=;
 b=l81IDjA9HRafhwfAqZ9MXQs6wOXwsuxmgPj65/oc76CWbIF7BUo1IGGCMWH/ypVAQP5wslk+x4vn43ZHRFovaFcy889NHGbxCuz6jI7WywmHo/PiCLnvoFlobZMROGekIgah+PQnj2TIBfNrXurMMonnST+BwVfVS8m7EQV4yBY=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yNyAxMDo1OCBhLm0uLCBHYcOrbCBIRVJNRVQgd3JvdGU6DQo+IEhpLA0KPiAN
Cj4gSSBoYXZlIGJlZW4gZmFjaW5nIGFuIGlzc3VlIHdpdGggbXkgNUsgZGlzcGxheSAoaWl5YW1h
IFByb0xpdGUNCj4gWEIyNzc5UVFTLVMxKS4NCj4gDQo+IEl0IHdvcmtzIGZpbmUgYXMgbG9uZyBh
cyBpdCBpcyB0aGUgb25seSBhY3RpdmUgbW9uaXRvciwgYXMgc29vbiBhcyBJDQo+IGFjdGl2YXRl
IGFub3RoZXIgbW9uaXRvciB0aGUgbWFpbiBvbmUgKDVrKSBjYW4ndCBkaXNwbGF5IG1vcmUgdGhh
biA0ay4NCj4gDQo+IERlYnVnIHVzaW5nICJlY2hvIDB4NCA+IC9zeXMvbW9kdWxlL2RybS9wYXJh
bWV0ZXJzL2RlYnVnIiBzaG93IHRoaXMgOg0KPiBtYWkgMjMgMDk6MDE6MjIgYnVyZWF1LWdhZWwg
L3Vzci9saWIvZ2RtMy9nZG0teC1zZXNzaW9uWzM0NjVdOiAoRUUpDQo+IEFNREdQVSgwKTogZmFp
bGVkIHRvIHNldCBtb2RlOiBJbnZhbGlkIGFyZ3VtZW50DQo+IG1haSAyMyAwOTowMToyMiBidXJl
YXUtZ2FlbCBrZXJuZWw6IFtkcm06ZGNlMTEyX3ZhbGlkYXRlX2JhbmR3aWR0aA0KPiBbYW1kZ3B1
XV0gZGNlMTEyX3ZhbGlkYXRlX2JhbmR3aWR0aDogQmFuZHdpZHRoIHZhbGlkYXRpb24gZmFpbGVk
IQ0KPiANCj4gSSBkaXNhYmxlZCB0aGUgY2hlY2sgYnkgZm9yY2luZyBpc19kaXNwbGF5X2NvbmZp
Z3VyYXRpb25fc3VwcG9ydGVkIHRvDQo+IHJldHVybiB0cnVlIGluIGRjZV9jYWxjcy5jIGFuZCBp
dCB3b3JrcyBmaW5lLg0KPiANCj4gQW55dGhpbmcgSSBjYW4gZG8gdG8gY29ycmVjdCB0aGlzIGJh
bmR3aWR0aCBjYWxjdWxhdGlvbiA/DQo+IA0KDQpUaGUgYmFuZHdpZHRoIGZvcm11bGFzIGNvbWUg
ZnJvbSBvdXIgSFcgdGVhbXMgYW5kIHVzdWFsbHkgbGVhdmUgYSBnb29kDQptYXJnaW4gb2YgZXJy
b3IuIENoYW5naW5nIHRoZSBmb3JtdWxhcyB0byBhbGxvdyBmb3IgeW91ciBjYXNlIGlzbid0IGEN
CmNvcnJlY3Rpb24gYXMgaXQgbWlnaHQgY2F1c2UgaXNzdWVzIGluIGNlcnRhaW4gc2NlbmFyaW91
cywgaS5lLiB0aGVyZSdzDQpubyBtb3JlIGd1YXJhbnRlZSB0aGF0IHRoaW5ncyB3b3JrIGFzIGV4
cGVjdGVkLg0KDQpFeGFtcGxlcyBhcmUgNGsgdmlkZW8gcGxheWJhY2sgKGVzcGVjaWFsbHkgbXVs
dGlwbGUgdmlkZW9zKSwgZ2FtaW5nLg0KQW55dGhpbmcgdGhhdCBkb2VzIGEgbG90IG9mIEdQVSBt
ZW1vcnkgYWNjZXNzLg0KDQpJc3N1ZXMgdGhhdCBtaWdodCBhcHBlYXIgYXJlIHVuZGVyZmxvdywg
aS5lLiB3aGl0ZSBsaW5lcyBvbiB0aGUgc2NyZWVuLg0KSW4gZXh0cmVtZSBjYXNlcyB1bmRlcmZs
b3cgbWlnaHQgZXZlbiBoYW5nIHRoZSBlbnRpcmUgZGlzcGxheSBwaXBlLg0KDQpIYXJyeQ0KDQo+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
