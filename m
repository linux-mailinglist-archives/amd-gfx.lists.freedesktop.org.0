Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1F5DCB2
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 05:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BF06E0C4;
	Wed,  3 Jul 2019 03:01:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730054.outbound.protection.outlook.com [40.107.73.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646126E0C4
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 03:01:00 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2452.namprd12.prod.outlook.com (52.132.11.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 03:00:57 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::84a6:9940:df8d:5c0a]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::84a6:9940:df8d:5c0a%2]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 03:00:57 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/1] drm/amdkfd: Remove unused variable
Thread-Topic: [PATCH 1/1] drm/amdkfd: Remove unused variable
Thread-Index: AQHVMUogopXoac41V0m3mvET3cAhMqa4NGcw
Date: Wed, 3 Jul 2019 03:00:57 +0000
Message-ID: <BL0PR12MB2580650991A6A853F8DC1BD180FB0@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20190703025028.13588-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190703025028.13588-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c02ebc2e-f758-4a2a-82ca-08d6ff62ac19
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2452; 
x-ms-traffictypediagnostic: BL0PR12MB2452:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR12MB2452BD0E164D87AB9CF67F7880FB0@BL0PR12MB2452.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:147;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(199004)(13464003)(189003)(256004)(99286004)(7696005)(66066001)(53936002)(6116002)(3846002)(305945005)(6306002)(4326008)(68736007)(2501003)(486006)(446003)(7736002)(55016002)(966005)(14454004)(11346002)(54906003)(14444005)(26005)(52536014)(110136005)(9686003)(6246003)(72206003)(478600001)(5660300002)(66556008)(81166006)(53546011)(81156014)(6506007)(316002)(8676002)(8936002)(6436002)(86362001)(76176011)(76116006)(71200400001)(71190400001)(229853002)(186003)(33656002)(74316002)(476003)(102836004)(64756008)(2906002)(25786009)(66476007)(73956011)(66446008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2452;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cFjWJRtLazMrfQ+AqY/Qwn+YUj6Q9mXy57uF8vTDTVxpu0HLWGnElFPPKA8nuYEFn44hfWTCZaw5R0izfMLnvuypF3g0SVIauGCsnvbLvgUwJ/Ce7dpbDuopuUvoS93IHyupgcHm5e3gpwH+QcOVIfXa1PyjZUiYGokln+MeLLBFzUM3BvIkvs8iQHFdYU7Srfru2ZZX6f3SMfUhe/7ftXGbBjaJnrOS7W17e4vh2SD3GOEWoXPc4knRRQ6GKsV+JQLQTVg9esrk/Wc4b9fuIyS52vZ64m36/+L3GU20d2WqK6WxVFs/LnFXRnrYT1g6SHRo24iI9XH1yc3sNhsiiPUTYCg8/b/TTYjR8w+Vpga0sM9Jestiktfxb13N+l3uvTW6RR9W2zOT7guE8bmj8W56t/wxspACodSbxQ8FIgk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02ebc2e-f758-4a2a-82ca-08d6ff62ac19
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 03:00:57.7585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2452
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns4Rt2ltniZzpJtwFZ9/k4r8QbIdwIgo98PXCoUi6sQ=;
 b=qIEN3COHau/QvEALYqObVVk9ra0dVziW0zXtnFbgYDCKfY0Rg72yBZ8s3dKPA9ZzcPpXkTRlivWo+8q3/9T0DJOoDXza1RB6s5vLfZxc1m1p736wMkmryANH3xl75VCBABJKuSfNe00/ZdxReaomAfUcJIDRmbeIB6Ovj5v7QRw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KDQpSZWdhcmRzLA0KT2Fr
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS3VlaGxpbmcsIEZlbGl4
DQpTZW50OiBXZWRuZXNkYXksIEp1bHkgMywgMjAxOSAxMDo1MSBBTQ0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0gg
MS8xXSBkcm0vYW1ka2ZkOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlDQoNCkZpeCBhbiBvYnZpb3Vz
IGNvbXBpbGVyIHdhcm5pbmcuDQoNCkZpeGVzOiBiMWU2NjM5ODMwYmQwICgiZHJtL2FtZGtmZDog
cmVtb3ZlIGR1cGxpY2F0ZWQgUENJRSBhdG9taWNzIHJlcXVlc3QiKQ0KQ0M6IEphY2sgWGlhbyA8
SmFjay5YaWFvQGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXgu
S3VlaGxpbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYyB8IDEgLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCmluZGV4IDI0ZGI4MmI2MWIwYi4uMzMyMmE0
NDNkZmIyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCkBAIC00
ODcsNyArNDg3LDYgQEAgc3RydWN0IGtmZF9kZXYgKmtnZDJrZmRfcHJvYmUoc3RydWN0IGtnZF9k
ZXYgKmtnZCwNCiAJc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBrZmQya2dkX2Nh
bGxzICpmMmcpICB7DQogCXN0cnVjdCBrZmRfZGV2ICprZmQ7DQotCWludCByZXQ7DQogCWNvbnN0
IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gKmRldmljZV9pbmZvID0NCiAJCQkJCWxvb2t1cF9kZXZp
Y2VfaW5mbyhwZGV2LT5kZXZpY2UpOw0KIA0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
