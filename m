Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599C10E32
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2019 22:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8036F892E7;
	Wed,  1 May 2019 20:44:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680085.outbound.protection.outlook.com [40.107.68.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C086892E7
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2019 20:44:32 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB3077.namprd12.prod.outlook.com (20.178.54.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 1 May 2019 20:44:29 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.018; Wed, 1 May 2019
 20:44:29 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH V2] drm/amdgpu: Fix VM clean check method
Thread-Topic: [PATCH V2] drm/amdgpu: Fix VM clean check method
Thread-Index: AQHU/2PR6AVFBIqSPEGYYClmzzIBTaZWvouA
Date: Wed, 1 May 2019 20:44:29 +0000
Message-ID: <c3825cb3-29a9-c234-b1f3-4151b08ab0f4@amd.com>
References: <1556635700-29967-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1556635700-29967-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YQBPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::34) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: beda8185-9b63-4cd5-ad67-08d6ce75ce59
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3077; 
x-ms-traffictypediagnostic: BYAPR12MB3077:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB30770A498C7157DCC67828C8923B0@BYAPR12MB3077.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(136003)(366004)(189003)(199004)(68736007)(8676002)(71200400001)(2501003)(476003)(7736002)(966005)(65826007)(81156014)(6486002)(305945005)(71190400001)(25786009)(36756003)(66476007)(73956011)(6246003)(31696002)(229853002)(65806001)(86362001)(446003)(65956001)(186003)(66556008)(2616005)(66446008)(11346002)(486006)(64756008)(66946007)(6506007)(66066001)(386003)(256004)(64126003)(81166006)(6512007)(3846002)(53936002)(478600001)(31686004)(102836004)(76176011)(14454004)(72206003)(6306002)(14444005)(316002)(8936002)(5660300002)(6436002)(2906002)(52116002)(26005)(99286004)(110136005)(6116002)(53546011)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3077;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n0zbO0Bz5t7o1BIM5ZZuhAHGWb9qkrlf6IwI19wzu6OdE+61ObF/vJcgU771uIb7JIMhIHUFeXcAmuhfk+Wi/uwiqe9MH1RUOp0nkXUWDv4slxe8iG/fBTVZS6fkNIvBoqx8MBo7ooiQZ2Q0ASB/9h1XwGSAzg2BSDgEt0SdN0dDdowJ2Zy9Jgxcf5qpLhCoOmLXGhjvjQFWgDR7fJK41VXaiPRkq2AbUGrRzNHg/C4vjM1gGCXRkiBUFdUIcvj0rkL1H78Sml72lhlgASSKR/3t7TwzUTZYrbeDMEd7VuIqhoARIcUyduW7D2psgNjnuiqrEuQDzhP0wBUkghKxQF21Ti9XYDWT3/+/5G66oANWChOYtnwfwSjau19ts1lOVzDkKWmc66thHC6EGLXFWLedZeXuolsFIw52T5cfm94=
Content-ID: <35E6E522F1498C4DB508FD5E308B6498@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beda8185-9b63-4cd5-ad67-08d6ce75ce59
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 20:44:29.2656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3077
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pcfd9eGzRC2FNkEMCmtwBtytpN3rkJdIGZYCtVGT/oY=;
 b=EfeBPu77j9i9kHPib33HYEcK3yOkCFW73Dbsp4XJAvlATK8hQL3WV23bOZIEX3/kLJryRKeTMS0PIWzDz6wR4A+j9Hb4sYN7+8x/bltnsCSjgGtXVzdEPA7r49kmGT2HLkByfajx7Lhbh6NJMBpIoUlseeERQ3CgPyqcjQ0Cm4M=
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

T24gMjAxOS0wNC0zMCAxMDo0OCBhLm0uLCBUcmlnZ2VyIEh1YW5nIHdyb3RlOg0KPiBbQ0FVVElP
TjogRXh0ZXJuYWwgRW1haWxdDQo+DQo+IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUgaXMgdXNlZCB0
byB0dXJuIGEgR0ZYIFZNIGludG8gYSBjb21wdXRlIFZNLA0KPiB0aGUgcHJlcmVxdWlzaXRlIGlz
IHRoaXMgVk0gaXMgY2xlYW4uIExldCdzIGNoZWNrIGlmIHNvbWUgcGFnZSB0YWJsZXMNCj4gYXJl
IGFscmVhZHkgZmlsbGVkICwgd2hpbGUgbm90IGNoZWNrIGlmIHNvbWUgbWFwcGluZyBpcyBhbHJl
YWR5IG1hZGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVh
bmdAYW1kLmNvbT4NCg0KQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPg0KDQpUaGVyZSBpcyBzdGlsbCBhIHBvdGVudGlhbCBwcm9ibGVtIGJlY2F1c2UgdGhl
IENTQSBpcyBhbHJlYWR5IGluIHRoZSBWTS4gDQpJZiBLRkQgdHJpZXMgdG8gbWFwIHNvbWV0aGlu
ZyBhdCB0aGUgc2FtZSB2aXJ0dWFsIGFkZHJlc3MsIGl0IHdpbGwgZmFpbC4gDQpJdCdzIHVubGlr
ZWx5IHRvIGhhcHBlbiB3aXRoIHRoZSBDU0EgcGxhY2VkIGF0IHRoZSB2ZXJ5IGVuZCBvZiB0aGUg
DQp2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuIE9uIEdGWHY5IGl0IHdvbid0IGhhcHBlbiBiZWNhdXNl
IEtGRCBvbmx5IHVzZXMgDQp0aGUgbG93ZXIgaGFsZiBvZiB0aGUgdmlydHVhbCBhZGRyZXNzIHNw
YWNlLiBPbiBHRlh2OCBpdCBtYXkgaGFwcGVuIGlmIGEgDQpLRkQgcHJvY2VzcyBtYW5hZ2VzIHRv
IGZpbGwgdXAgaXRzIGVudGlyZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuDQoNClJlZ2FyZHMsDQog
wqAgRmVsaXgNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+IGluZGV4IDU2ZDgzOGYuLmJkZThiY2QgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+IEBAIC0yNzU1LDYgKzI3
NTUsMzcgQEAgaW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3QgYW1kZ3B1X3ZtICp2bSwNCj4gICB9DQo+DQo+ICAgLyoqDQo+ICsgKiBhbWRncHVfdm1f
Y2hlY2tfY2xlYW5fcmVzZXJ2ZWQgLSBjaGVjayBpZiBhIFZNIGlzIGNsZWFuDQo+ICsgKg0KPiAr
ICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KPiArICogQHZtOiB0aGUgVk0gdG8gY2hl
Y2sNCj4gKyAqDQo+ICsgKiBjaGVjayBhbGwgZW50cmllcyBvZiB0aGUgcm9vdCBQRCwgaWYgYW55
IHN1YnNlcXVlbnQgUERzIGFyZSBhbGxvY2F0ZWQsDQo+ICsgKiBpdCBtZWFucyB0aGVyZSBhcmUg
cGFnZSB0YWJsZSBjcmVhdGluZyBhbmQgZmlsbGluZywgYW5kIGlzIG5vIGEgY2xlYW4NCj4gKyAq
IFZNDQo+ICsgKg0KPiArICogUmV0dXJuczoNCj4gKyAqICAgICAwIGlmIHRoaXMgVk0gaXMgY2xl
YW4NCj4gKyAqLw0KPiArc3RhdGljIGludCBhbWRncHVfdm1fY2hlY2tfY2xlYW5fcmVzZXJ2ZWQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICsgICAgICAgc3RydWN0IGFtZGdwdV92bSAq
dm0pDQo+ICt7DQo+ICsgICAgICAgZW51bSBhbWRncHVfdm1fbGV2ZWwgcm9vdCA9IGFkZXYtPnZt
X21hbmFnZXIucm9vdF9sZXZlbDsNCj4gKyAgICAgICB1bnNpZ25lZCBpbnQgZW50cmllcyA9IGFt
ZGdwdV92bV9udW1fZW50cmllcyhhZGV2LCByb290KTsNCj4gKyAgICAgICB1bnNpZ25lZCBpbnQg
aSA9IDA7DQo+ICsNCj4gKyAgICAgICBpZiAoISh2bS0+cm9vdC5lbnRyaWVzKSkNCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAwOw0KPiArDQo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IGVudHJp
ZXM7IGkrKykgew0KPiArICAgICAgICAgICAgICAgaWYgKHZtLT5yb290LmVudHJpZXNbaV0uYmFz
ZS5ibykNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAg
ICAgfQ0KPiArDQo+ICsgICAgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiAgICAq
IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUgLSBUdXJuIGEgR0ZYIFZNIGludG8gYSBjb21wdXRlIFZN
DQo+ICAgICoNCj4gICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyDQo+IEBAIC0yNzg0
LDcgKzI4MTUsNyBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sIHVucw0KPiAgICAgICAgICAgICAgICAg
IHJldHVybiByOw0KPg0KPiAgICAgICAgICAvKiBTYW5pdHkgY2hlY2tzICovDQo+IC0gICAgICAg
aWYgKCFSQl9FTVBUWV9ST09UKCZ2bS0+dmEucmJfcm9vdCkgfHwgdm0tPnJvb3QuZW50cmllcykg
ew0KPiArICAgICAgIGlmIChhbWRncHVfdm1fY2hlY2tfY2xlYW5fcmVzZXJ2ZWQoYWRldiwgdm0p
KSB7DQo+ICAgICAgICAgICAgICAgICAgciA9IC1FSU5WQUw7DQo+ICAgICAgICAgICAgICAgICAg
Z290byB1bnJlc2VydmVfYm87DQo+ICAgICAgICAgIH0NCj4gLS0NCj4gMi43LjQNCj4NCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
