Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBEE31685
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 23:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B6C89916;
	Fri, 31 May 2019 21:18:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1123D89919
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 21:18:34 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2842.namprd12.prod.outlook.com (20.176.116.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 31 May 2019 21:18:30 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 21:18:30 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVEbimTTWAfIcqrkueX5oyj1CRRqZ6r9UAgAnqagCAARpTgIAADdeAgAAG7QA=
Date: Fri, 31 May 2019 21:18:30 +0000
Message-ID: <986d89cd-1ae5-2e94-f366-3d02dfa27c8b@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
 <1558651263-3478-6-git-send-email-Oak.Zeng@amd.com>
 <4f49af4d-0953-030c-bb1b-47b7a5fa7c7c@amd.com>
 <CAPM=9tzs9adV7_ef4hpgswB-S==iQizAF_=FTarVm3EYwPCg0w@mail.gmail.com>
 <e857f0f4-341d-1e64-0ffe-5b6812ca5b7f@amd.com>
 <CAPM=9tzQB_SbCHcAcs3PRq-maed9XdMroROWNQuf9DdgOH5zcQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzQB_SbCHcAcs3PRq-maed9XdMroROWNQuf9DdgOH5zcQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::35) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c87bf804-39f5-41f7-067a-08d6e60d87a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2842; 
x-ms-traffictypediagnostic: DM6PR12MB2842:
x-microsoft-antispam-prvs: <DM6PR12MB2842A1B75730137A8A4EAF0292190@DM6PR12MB2842.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(346002)(136003)(396003)(189003)(199004)(6246003)(316002)(4326008)(6116002)(478600001)(53936002)(72206003)(6486002)(14444005)(76176011)(81156014)(64126003)(7736002)(14454004)(256004)(52116002)(53546011)(6512007)(6436002)(81166006)(8676002)(86362001)(68736007)(99286004)(6506007)(54906003)(64756008)(26005)(5660300002)(58126008)(2906002)(229853002)(3846002)(102836004)(31696002)(66946007)(66066001)(8936002)(25786009)(1411001)(6916009)(66476007)(66446008)(11346002)(73956011)(2616005)(186003)(446003)(305945005)(65826007)(36756003)(71200400001)(31686004)(486006)(65806001)(65956001)(71190400001)(476003)(66556008)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2842;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L18s7mJAe9ZZC+TYkcEa1VWqKUKrNYwQ+6fDIuJ8AI2VtOud9iMd87WKQWJAqkhf4KwQUuz2NbnjxkWkY7UZJfT+kAAAPoH4OLHEqdtOOUBVhg13M8U3Y/OAujiEBY6zI4P23CXQDum640t2TcrZlawTpxGLB01JUGrf9iKHyjD4IFAdTohJDUlqIb7JVEtjfMe71O2CQ5uR0okd+/Fd4exEWcznogj5htTZreaKBdlz1+2scjWDkaoEIJegxJ3X3uDh0tE8p7EfhnAcCTv7b0NXf1axdgGpXfIE6xIqrHrPAGpkgzDOdpHVtAcOdVdIFAg1mZSV9FxgfzmIk4VMpyxhvJFEknyo3RzngmIIZGVWc+AVL+ufD9PSlOzNu6R83N/+Z3n/cExhzyeSa6q8cNdghd3VKPIB/oS9t1OFoWc=
Content-ID: <FCBED785D2E82F44884D79F13B3B1D2C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87bf804-39f5-41f7-067a-08d6e60d87a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 21:18:30.6853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2842
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XQ+J+GBQ7eNgw1S2B0yyIFz+dJwW/BCZW7hdFriIxA=;
 b=XUUzshtL+oPkWXPRlSS418yqqHFTvOtjrUnBLw/oXvAPx8H9SGNNUdebLJRmocG7H8CXTk6x7KBQm2E3kHCkOHXxLnc8rwiPGBqpFIF6EKB+fstmr7eCGzzWodSFxdi2FP49RelK+kgUsrR6OYZDwl0V8YWsFy9Wcwbs7LjqyMo=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0zMSA0OjUzIHAubS4sIERhdmUgQWlybGllIHdyb3RlOg0KPiBPbiBTYXQsIDEg
SnVuIDIwMTkgYXQgMDY6MDQsIEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNv
bT4gd3JvdGU6DQo+PiBPbiAyMDE5LTA1LTMwIDExOjEzIHAubS4sIERhdmUgQWlybGllIHdyb3Rl
Og0KPj4+IE9uIFNhdCwgMjUgTWF5IDIwMTkgYXQgMDU6NDgsIEt1ZWhsaW5nLCBGZWxpeCA8RmVs
aXguS3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDIwMTktMDUtMjMgNjo0MSBwLm0u
LCBaZW5nLCBPYWsgd3JvdGU6DQo+Pj4+PiBBZGQgYSBuZXcga2ZkIGlvY3RsIHRvIGFsbG9jYXRl
IHF1ZXVlIEdXUy4gUXVldWUNCj4+Pj4+IEdXUyBpcyByZWxlYXNlZCBvbiBxdWV1ZSBkZXN0cm95
Lg0KPj4+Pj4NCj4+Pj4+IENoYW5nZS1JZDogSTYwMTUzYzI2YTU3Nzk5MmFkODczZTQyOTJlNzU5
ZTVjM2Q1YmJkMTUNCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQu
Y29tPg0KPj4+PiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+DQo+Pj4+DQo+Pj4gYnR3IGp1c3Qgbm90aWNlZCBpbiBwYXNzaW5nIHdlIGFyZSBhZGRp
bmcgbmV3IGZlYXR1cmVzIHRvIGtmZCwgaXMNCj4+PiB0aGVyZSBhbiBvcGVuIHNvdXJjZSBkZXZl
bG9wZWQgdXNlcnNwYWNlIHRvIGdvIGFsb25nIHdpdGggdGhpcywgdGhlcmUNCj4+PiBuZWVkcyB0
byBhIGRldiBicmFuY2ggaW4gcHVibGljIGJlZm9yZSBuZXcgaW9jdGxzL3VhcGkgc3VyZmFjZXMg
c2hvdWxkDQo+Pj4gYmUgYWRkZWQgdG8gdGhlIGtlcm5lbC4NCj4+Pg0KPj4+IFRoZSBjb21taXRz
IHNob3VsZCBwcm9iYWJseSBoYXZlIHBvaW50ZXJzIHRvIHRoYXQgYnJhbmNoLg0KPj4gQWgsIGEg
Y2hpY2tlbiBhbmQgZWdnIHByb2JsZW0uIEkgdGhpbmsgdGhpcyBpcyB0aGUgZmlyc3QgdGltZSB3
ZSdyZQ0KPj4gYWRkaW5nIGEgbmV3IGlvY3RsIHRvIHVwc3RyZWFtIEtGRCByYXRoZXIgdGhhbiB1
cHN0cmVhbWluZyBvbmUgdGhhdCdzDQo+PiBiZWVuIGRldmVsb3BlZCBpbnRlcm5hbGx5IGZpcnN0
LiBNYXliZSBub3QgdGhlIHJpZ2h0IHdheSB0byBkbyBpdC4NCj4gVGhlcmUgaXMgbm8gY2hpY2tl
bi9lZ2cgcHJvYmxlbSBoZXJlLiBZb3UgZGV2ZWxvcCBrZXJuZWwgYW5kIHVzZXJzcGFjZQ0KPiBp
biBwYXJhbGxlbCBpbiB0aGUgb3Blbiwgb25jZSB5b3UgYXJlIGhhcHB5IGFuZCBib3RoIHNpZGVz
IGFyZQ0KPiByZXZpZXdlZCB5b3UgbWVyZ2Uga2VybmVsIHRoZW4gdXNlcnNwYWNlLg0KDQpZb3Un
cmUgcmlnaHQuIEl0IHdvdWxkIGJlIHN0cmFpZ2h0IGZvcndhcmQgaWYgd2UgaGFkIHB1YmxpYyBj
b2RlIHJldmlldyANCmZvciB0aGUgdXNlciBtb2RlIGNvbXBvbmVudC4gV2UncmUgdHJ5aW5nIHRv
IGNvbnZpbmNlIG91ciBkZXYtb3BzIHRlYW0gDQp0aGF0IHdlIG5lZWQgcHVibGljIGdpdCByZXBv
c2l0b3JpZXMgd2l0aG91dCBsb3Npbmcgc3VwcG9ydCBmcm9tIG91ciANCmludGVybmFsIGJ1aWxk
IGFuZCB0ZXN0IGluZnJhc3RydWN0dXJlLiBZb3VyIGNvbW1lbnQgaGVscHMgcHJvdmlkZSBzb21l
IA0KY29udGV4dCBhbmQgdXJnZW5jeSBmb3IgdGhhdCByZXF1ZXN0Lg0KDQpUaGFua3MsDQogwqAg
RmVsaXgNCg0KDQo+DQo+IERhdmUuDQo+DQo+PiBJIHNob3VsZCBiZSBhYmxlIHRvIHB1Ymxpc2gg
dGhlIHVzZXIgbW9kZSBjb2RlIGluIGxpYmhzYWttdCBuZXh0IHdlZWsuDQo+PiBUaGVuIHdlJ2xs
IHdvcmsgb24gYSBrZmR0ZXN0IHRvIHZhbGlkYXRlIHRoZSBmaXJtd2FyZSBmdW5jdGlvbmFsaXR5
Lg0KPj4gRmluYWxseSB3ZSdsbCB1c2UgR1dTIGZ1cnRoZXIgdXAgdGhlIHNvZnR3YXJlIHN0YWNr
IGZvciBzeW5jaHJvbml6YXRpb24NCj4+IG9mIGNvbmN1cnJlbnQgY29tcHV0ZSB3b3JrZ3JvdXBz
Lg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiAgICAgRmVsaXgNCj4+DQo+Pg0KPj4+IERhdmUuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
