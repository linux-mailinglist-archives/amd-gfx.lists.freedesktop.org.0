Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4374ECD1
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 18:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38B96E8ED;
	Fri, 21 Jun 2019 16:09:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690052.outbound.protection.outlook.com [40.107.69.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276B56E8ED
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 16:09:34 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3516.namprd12.prod.outlook.com (20.179.106.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 21 Jun 2019 16:09:32 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.2008.014; Fri, 21 Jun 2019
 16:09:32 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>
Subject: Re: [PATCH] drm/amdgpu: add sw_init to df_v1_7
Thread-Topic: [PATCH] drm/amdgpu: add sw_init to df_v1_7
Thread-Index: AQHVKEu26/IiOM7CwEOYUUbDnW5RGg==
Date: Fri, 21 Jun 2019 16:09:32 +0000
Message-ID: <8d2e2498-573d-d23a-62e3-3881c9b1c24e@amd.com>
References: <20190621153054.88153-1-jonathan.kim@amd.com>
In-Reply-To: <20190621153054.88153-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94babef9-762d-4a2c-ddc6-08d6f662d86c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3516; 
x-ms-traffictypediagnostic: DM6PR12MB3516:
x-microsoft-antispam-prvs: <DM6PR12MB35165F9D4F42E42EB269766B92E70@DM6PR12MB3516.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(136003)(39860400002)(396003)(346002)(189003)(199004)(110136005)(66066001)(3846002)(5660300002)(66446008)(6116002)(305945005)(66556008)(36756003)(256004)(66476007)(8676002)(6506007)(386003)(6636002)(53546011)(52116002)(76176011)(65826007)(316002)(2501003)(11346002)(2616005)(476003)(58126008)(186003)(2906002)(72206003)(71190400001)(102836004)(486006)(6436002)(71200400001)(99286004)(6512007)(6246003)(6486002)(64756008)(446003)(66946007)(25786009)(73956011)(26005)(31696002)(53936002)(478600001)(229853002)(31686004)(65806001)(14454004)(68736007)(86362001)(65956001)(7736002)(8936002)(64126003)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3516;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /KsxYEjMCKXIKp036sRDSh33LiL75yVauq9+EIJQqPxdlQGmzC0Lr8EykOHAQ/cv/njmDusnjL27gwOovSUU+c8iPfrnSAbM5zsbEsf8NhiUbScyQRgnMrw2ZTLA8aT64bjfebpDByUFr9UPjrJqlAmQo5dBfvuSZYJ5Y2E0Oh3pMzZJhKOc8fjLUXZ85IzsrtJGgHjpU8GgjT5po5FhYKZlwNRmYWtOesDNfaLq0+f9n+wgeAvN3ivdIf04SRv4W4dkPDgFCANog+VscMycwQKUvhHKb90viEUX7flvftCI177K+tn8cJus3GZV035I0aN7j85m/REcN869oPtJKGxVCIQSORU4+mTZ/ehB2OhdXF7mmJj6d5V2nsUUHE9lGAdkShtjydwOOjwgyTPzkv6O4RmFW0La65g+AsdSnMU=
Content-ID: <28FEEBA2159C644C8A4128EFDB9D48F9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94babef9-762d-4a2c-ddc6-08d6f662d86c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 16:09:32.4801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjueyuE09vpPSy7ZLSSW/XE/p/85jgTR1AcLi/h+lmE=;
 b=F4+u8sY5Vn/H1aYMfyo0m2hd+h2UmOHJZhIjRACM1F7uzXxAUvXPDn3EnKHWpEQIf6JPQ1ei8Ih00y15+pHn2Nfzx0g2/wkHbCPsJF/Gjfk6VUpvXxV0CHJRpCxWH3bFmzCWfnN8Sq67tN8dAP64/O0tUEH1Nz6k4/OXrElO1RM=
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

T24gMjAxOS0wNi0yMSAxMTozMSBhLm0uLCBLaW0sIEpvbmF0aGFuIHdyb3RlOg0KPiBjaGFuZ2Ug
ZGZfaW5pdCB0byBkZl9zd19pbml0IGRmIDEuNyB0byBwcmV2ZW50IHJlZ3Jlc3Npb24gaXNzdWVz
IG9uIHByZS12ZWdhMjANCj4gcHJvZHVjdHMgd2hlbiBjYWxsYmFjayBpcyBjYWxsZWQgaW4gc3df
Y29tbW9uX3N3X2luaXQuDQo+DQo+IENoYW5nZS1JZDogSTQ5NDEwMDNlYTRhOTliYTBlYTczNmM3
ZWNjODgwMDE0ODQyM2MzNzkNCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhh
bi5LaW1AYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPg0KDQpTbyB5b3VyIHByZXZpb3VzIHBhdGNoIGJyb2tlIHRoZSBidWlsZC4g
UGxlYXNlIGF0IGxlYXN0IGJ1aWxkIHRlc3QgeW91ciANCmNvZGUgYmVmb3JlIHlvdSBwdXNoLiBC
cmVha2luZyB0aGUgYnVpbGQgaXMgbm90IGFjY2VwdGFibGUuIEl0IHNsb3dzIA0KZG93biBldmVy
eWJvZHkgZWxzZS4gSSdsbCB0YWtlIGEgbG9vayBpZiBhbnl0aGluZyBlbHNlIGNhbiBiZSBjbGVh
bmVkIHVwIA0Kd2l0aCB0aGVzZSBjYWxsYmFja3MgbGF0ZXIuDQoNCg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92MV83LmMgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGZfdjFfNy5jDQo+IGluZGV4IDk5MzUzNzFkYjdjZS4uODQ0YzAzODY4MjQ4IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92MV83LmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jDQo+IEBAIC0yOSw3ICsyOSw3
IEBADQo+ICAgDQo+ICAgc3RhdGljIHUzMiBkZl92MV83X2NoYW5uZWxfbnVtYmVyW10gPSB7MSwg
MiwgMCwgNCwgMCwgOCwgMCwgMTYsIDJ9Ow0KPiAgIA0KPiAtc3RhdGljIHZvaWQgZGZfdjFfN19p
bml0IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gK3N0YXRpYyB2b2lkIGRmX3YxXzdf
c3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICB7DQo+ICAgfQ0KPiAgIA0K
PiBAQCAtMTEwLDcgKzExMCw3IEBAIHN0YXRpYyB2b2lkIGRmX3YxXzdfZW5hYmxlX2VjY19mb3Jj
ZV9wYXJfd3Jfcm13KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIH0NCj4gICANCj4g
ICBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2RmX2Z1bmNzIGRmX3YxXzdfZnVuY3MgPSB7DQo+IC0JLmlu
aXQgPSBkZl92MV83X2luaXQsDQo+ICsJLnN3X2luaXQgPSBkZl92MV83X3N3X2luaXQsDQo+ICAg
CS5lbmFibGVfYnJvYWRjYXN0X21vZGUgPSBkZl92MV83X2VuYWJsZV9icm9hZGNhc3RfbW9kZSwN
Cj4gICAJLmdldF9mYl9jaGFubmVsX251bWJlciA9IGRmX3YxXzdfZ2V0X2ZiX2NoYW5uZWxfbnVt
YmVyLA0KPiAgIAkuZ2V0X2hibV9jaGFubmVsX251bWJlciA9IGRmX3YxXzdfZ2V0X2hibV9jaGFu
bmVsX251bWJlciwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
