Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3874CBE1F
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 16:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F10D6EBC0;
	Fri,  4 Oct 2019 14:54:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700074.outbound.protection.outlook.com [40.107.70.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86E56EBC0
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 14:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHH6qRPbXXWLL0YeUyrL9tYJC+EsuN7WdDPJ8b9gq9+yb4+7Lk7z5nvQm4On6EYsxEXY+wQUOL0Wx3+xEOUcDJlRIcRzNwODcNO/oPAe5ENCoPP9CLCb+dH99NoVykVg620hakm3yLjsgzwzNoTA8st7b4ZRml+ZTikYH8ZjHUDPhQ6lrvg3lSgu2zuKfqJds8sj9VecdzBtXvRD/B5bI1F6QjqPjRX/0PNXqqsy7+In4V3+9B4tNgA30BI1mJnc7lGbv1jnXP/+RMLs4LTTE8U4wSdAzub++YoeODupArOwVPdSGsfDlSXJs8kTWRzRHRufqKJbG1YreeMP6Qa8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijnjHcfWZMv8mMGHO1pDfDs4u6s4JaKiMI8WFudb0WA=;
 b=FChFSuOPJ+wKHJ1kCwbuxKpGEp2aF//8DSq5S2SVvFczyQ/8TqiYQSd9J1PubIRmtMHHcgEsc+qS2smxGd7CrfGoI/MnS6LHY3t78TbOWZ6I8FF9qWLytQje46EmcP07yuxWYXxlLhfyEhi3HAmYpovX1fafluTlMBCBHRYWsySZPEQnV+9LmvS5wXjokvTvo2vczotdOBT96hZFeYWI9cqvCr+znZn+KG538ASjZkRBT1THrgB2zkxvr/0m1PrqLupcfZ5nOkC4shD/s8CSRjyjaCoQM7VLs9wZo/Pg/lNDysy6HFSLlSid5Qw5nSWG5gxrawUiKJQ7vo/Joa2gSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2732.namprd12.prod.outlook.com (20.176.118.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 14:53:32 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::b5e5:7607:69b9:620a]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::b5e5:7607:69b9:620a%5]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:53:32 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Fix MQD size calculation
Thread-Topic: [PATCH 1/2] drm/amdkfd: Fix MQD size calculation
Thread-Index: AQHVesLRKN1jBOVXnUu3f+IdCLXhJKdKkWkA
Date: Fri, 4 Oct 2019 14:53:32 +0000
Message-ID: <c9b1f0d0-e449-ba40-76c2-14e01830bc1f@amd.com>
References: <1570200515-18992-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1570200515-18992-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::25) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89b269d0-d6db-42a6-dbe2-08d748da9fe2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2732:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB27328D8EE3AFC3DA8563F936929E0@DM6PR12MB2732.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(189003)(199004)(6246003)(478600001)(6486002)(6512007)(58126008)(2906002)(25786009)(486006)(2616005)(476003)(14454004)(81156014)(6116002)(8676002)(3846002)(2501003)(11346002)(110136005)(316002)(81166006)(31696002)(8936002)(36756003)(229853002)(31686004)(6506007)(86362001)(6436002)(5660300002)(71190400001)(71200400001)(7736002)(65956001)(26005)(305945005)(4326008)(186003)(99286004)(256004)(446003)(66476007)(66556008)(66946007)(64756008)(102836004)(66446008)(76176011)(52116002)(14444005)(66066001)(53546011)(386003)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2732;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 19VL4lxBwCphVeKZEmJObzSmq8cT2oANZjPe2fLlwPkmGlOh/St6Jt7nBL6gRifTIHFdP6hL9mkG3kDV2OKTwuJgUpNz8Z5ZpE4sMmEJLbqKbVS+9VY9bpcwQMO8F3GeNacpy+9ZLoFF2KbexLDBB6lBd+G5V/QxWAbYsuyiglNjsLKjAdjs5TYoTLayIzNo2+dXaq16B8ThGRWeZQtoAjoUKhEOp5TdaICvwz9k1hEbmfrrYG431gV0zzfJFebDqww88wRQ+b6kTScjlNutrg9HmXoTeU8X/j2lTxZsXMwayA27UexwtnJCrz2zbrmuwcrsD80POheJb6QlXXoF3nBnG8sbbTyTqp/+WFg/GwYejxM2er30Cfnq/WBPbz28Zpx3HVs3OqY8BUSXCIfalQpGtHg1HScX1WlGCs+DRs8=
Content-ID: <C09A5C45786BFE4DA8491C8D246D7174@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b269d0-d6db-42a6-dbe2-08d748da9fe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:53:32.2517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MmJ9LCpKy5I8JlHpRO6XpihEGEB+68TcljtPnhpt5+1oMNnXZv4BtqaJ8NEK95uhl9guT/6EQneqoiq0anjU1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2732
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijnjHcfWZMv8mMGHO1pDfDs4u6s4JaKiMI8WFudb0WA=;
 b=dGoTmYUaCnp8IU3g3K7FyHuQF9d2Ed9ixbY5C9FqK5L1kr4qeC5/iZmHPIkSvlYFuc/+toKwS5znlNgwESI9onXyAma3oajhLC3XFVUoMv3OhcujZfEdtIlszqsiZAtgmQ2ge91QlrH10nG2UI8Z8o7VW49SvoOGjEsdkSBwp+k=
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
Cc: "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wNCAxMDo0OCwgWmVuZywgT2FrIHdyb3RlOg0KPiBPbiBkZXZpY2UgaW5pdGlh
bGl6YXRpb24sIGEgdHJ1bmsgb2YgR1RUIG1lbW9yeSBpcyBwcmUtYWxsb2NhdGVkIGZvcg0KPiBI
SVEgYW5kIGFsbCBTRE1BIHF1ZXVlcyBtcWQuIFRoZSBzaXplIG9mIHRoaXMgYWxsb2NhdGlvbiB3
YXMgd3JvbmcuDQo+IFRoZSBjb3JyZWN0IHNkbWEgZW5naW5lIG51bWJlciBzaG91bGQgYmUgUENJ
ZS1vcHRpbWl6ZWQgU0RNQSBlbmdpbmUNCj4gbnVtYmVyIHBsdXMgeGdtaSBTRE1BIGVuZ2luZSBu
dW1iZXIuDQo+DQo+IENoYW5nZS1JZDogSWVjZDExYWU0ZjVhMzE0NTkxNTY2NzcyYWEyYTIzZTFm
ZTRiOTQyNzUNCj4gUmVwb3J0ZWQtYnk6IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KDQpNaW5vciBj
b3NtZXRpYyBuaXQtcGljayBpbmxpbmUgdGhhdCBjaGVja3BhdGNoLnBsIHdvdWxkIHByb2JhYmx5
IHdhcm4gDQphYm91dC4gV2l0aCB0aGF0IGZpeGVkLCB0aGlzIHBhdGNoIGlzDQoNClJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5j
IHwgMyArKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2VfcXVldWVfbWFuYWdlci5jDQo+IGluZGV4IDE2YzA0ZjguLmU1NWQwMjEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFu
YWdlci5jDQo+IEBAIC0xODQ5LDcgKzE4NDksOCBAQCBzdGF0aWMgaW50IGFsbG9jYXRlX2hpcV9z
ZG1hX21xZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkNCj4gICAJc3RydWN0IGtm
ZF9kZXYgKmRldiA9IGRxbS0+ZGV2Ow0KPiAgIAlzdHJ1Y3Qga2ZkX21lbV9vYmogKm1lbV9vYmog
PSAmZHFtLT5oaXFfc2RtYV9tcWQ7DQo+ICAgCXVpbnQzMl90IHNpemUgPSBkcW0tPm1xZF9tZ3Jz
W0tGRF9NUURfVFlQRV9TRE1BXS0+bXFkX3NpemUgKg0KPiAtCQlkZXYtPmRldmljZV9pbmZvLT5u
dW1fc2RtYV9lbmdpbmVzICoNCj4gKwkJKGRldi0+ZGV2aWNlX2luZm8tPm51bV9zZG1hX2VuZ2lu
ZXMgKw0KPiArCQlkZXYtPmRldmljZV9pbmZvLT5udW1feGdtaV9zZG1hX2VuZ2luZXMpKg0KDQpU
aGVyZSBzaG91bGQgYmUgYSBzcGFjZSBiZXR3ZWVuICkgYW5kICouDQoNCg0KPiAgIAkJZGV2LT5k
ZXZpY2VfaW5mby0+bnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgKw0KPiAgIAkJZHFtLT5tcWRf
bWdyc1tLRkRfTVFEX1RZUEVfSElRXS0+bXFkX3NpemU7DQo+ICAgDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
