Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A748B11F7
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 17:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F297F6EDA4;
	Thu, 12 Sep 2019 15:18:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700065.outbound.protection.outlook.com [40.107.70.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBB46EDA4
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 15:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9/nXz9HwstHb1VkUlsvz+LkEGdQbtJm9o4+qakkQLgBIsc3jPI73kzpiIeSY+ny7BDze5tvIcEgrsU3tOxTRoHRLORrf4NQBKPcovYIrF//Qk5yz3VhdTKSj3uJQrz68eeai9o/XOPYrALJWr92QxljskE4Q8hnXHAotKkmlYSKdpIROccJqnhcL+dBLGIRAg3NcQcZTOz1zH96nPWV+3TVbQnUFcRD2PHO0OGplFXkxRZ6GiyFsbZzbp6bA4YS4fYfLUua5MlJZzjDFJ+napt99kusvOvlAma9TDO8/B77c/moUvMjvEsfEy3KZ841yxA7P9FP83+cf/rsgdYMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEQR2PR/F0VjPXzOaoS46KoMo2MHXnQMwpT/dlV7xVI=;
 b=corIsK5LFS87xLjWcia7QJi5H1KUpZxqcNyO23ZL060dDTDPbwjASgaQoKzhsKeRWjB070lUT/6Er4XLncWKZEBfiPQTdctt/ihG1OQ6SzWBoj6BZa2n2Bf5DFKzXH9pXFyCijs/ewcsSJY6g9MXlzP0XHvocQBg7X+Ws4rYek60UsYxwHH9CvRByWGyDqwmxnjcV/Dhf6zGA9M/Otl948vHk2Rp+0TKmOiq1jwxD2XauLmW/ij2+taipnxvDukbw4ycGleYAjKruXVw/lQmXKOfcAtcB8vMC0P4FcJ9wMrjJhwPoc2sxUmQenyQ8x1nzsfKJtsNSLHrPqS5knpbJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3456.namprd12.prod.outlook.com (20.178.242.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 15:18:43 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2%2]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 15:18:43 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?UmXvvJpbUEFUQ0hdIGRybS9hbWRncHU6IHJlc3ZlcnQgImRpc2FibGUgYnVs?=
 =?utf-8?Q?k_moves_for_now"?=
Thread-Topic: =?utf-8?B?UmXvvJpbUEFUQ0hdIGRybS9hbWRncHU6IHJlc3ZlcnQgImRpc2FibGUgYnVs?=
 =?utf-8?Q?k_moves_for_now"?=
Thread-Index: AQHVaVMJSR8RAX/qXkO3L0QEqdfU7acoEqsAgAAT9YCAAAF0dg==
Date: Thu, 12 Sep 2019 15:18:43 +0000
Message-ID: <ayyik7-bhm0th-f76qzcrx4nuhoz097-fqib6y-d00kkm-l8swdj-bb0hlq-6hyzem-xpderd-hmxy8m-n7py9m2f0bz2o58vot2offja-ec4pyzuy9pjm-235qpt-69n2k9ugq2z1gpw45e-vjjmkviqgdj4.1568301521040@email.android.com>
References: <20190912101535.71686-1-christian.koenig@amd.com>
 <f0b19f35-5852-8cbe-2256-e769169d8884@amd.com>,
 <df915c16-198d-502d-6eed-975a0471ec13@gmail.com>
In-Reply-To: <df915c16-198d-502d-6eed-975a0471ec13@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.87.176.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fdb5bbe-f809-4a7c-72bc-08d737947fe5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3456; 
x-ms-traffictypediagnostic: MN2PR12MB3456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB345665403BD50AD3EAB141FAB4B00@MN2PR12MB3456.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(189003)(199004)(52314003)(478600001)(76116006)(6486002)(25786009)(3846002)(6116002)(9686003)(53936002)(6436002)(476003)(14444005)(54896002)(6512007)(256004)(5660300002)(86362001)(71190400001)(71200400001)(66574012)(11346002)(446003)(316002)(110136005)(7736002)(14454004)(6506007)(102836004)(76176011)(186003)(26005)(99286004)(486006)(2501003)(81156014)(8936002)(2906002)(66066001)(81166006)(66446008)(64756008)(66556008)(66476007)(91956017)(66946007)(87826002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3456;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nWbCYNOmF5D7zJIUOzxOXXoVMiahLaTZZSLuYXwu7aXUrGuD8gMmuPRBgsYS7969iofpzrLep8+Tx/wSFVk0BIvEyq7mkR/Uvvx0upcy1xpBHwqij5VA4giTCUp6Ph0TC1bIfY1gNIGmlinHtEm5tXsESvhCEh9+IpRPmx4FvQqLPf5ordauJFPhJCJ8Nrz2ypVjqCt12HgcU3rEEaKN2PiowaKY6Lagngw3sEo9MkyPDfx7bB9hfpk0/kMZIQJrYG4K+ddacbburWf4cQZW9JRYOYRqZG6Qc0lbsrCpnbg1vqN76yiPNx03OXD+iN3r5FofZFs13VIAH/lSZy0jTYbSPXgkWdhc/x0fL7eoslxUmp09tIO64MbTToIJ/Qhntl820kdGDfbO7P511vyMuzGiHnzsSnZZbTwEAnl/euc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdb5bbe-f809-4a7c-72bc-08d737947fe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 15:18:43.4886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eq20hpIE3fbbvc86kmrtNnxrVcDH25cRhxh94qDFdVyaTooocfz0E34crJ2GAiHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3456
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEQR2PR/F0VjPXzOaoS46KoMo2MHXnQMwpT/dlV7xVI=;
 b=MS+KnOyefUcheBJyKPDg3sjyyPwEcXL4bZ/nasdN0fyvwVk5BhCXxGOOZeJNmP5KTO3tihpdiJXTmG9Humr9uO3H/bi8RXIc/MZngH9f1+q74WI7l8QfJXLdVzAwQGhmoaWhJzQxTFzJEM0O+8YFLjvYFO1ZxQJrN8cOzMgsEQs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0314188948=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0314188948==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_ayyik7bhm0thf76qzcrx4nuhoz097fqib6yd00kkml8swdjbb0hlq6h_"

--_000_ayyik7bhm0thf76qzcrx4nuhoz097fqib6yd00kkml8swdjbb0hlq6h_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBkb250IGtub3cgZGttcyBzdGF0dXPvvIxhbnl3YXksIHdlIHNob3VsZCBzdWJtaXQgdGhpcyBv
bmUgYXMgZWFybHkgYXMgcG9zc2libGUuDQoNCi0tLS0tLS0tIOWOn+Wni+mCruS7tiAtLS0tLS0t
LQ0K5Li76aKY77yaUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogcmVzdmVydCAiZGlzYWJsZSBidWxr
IG1vdmVzIGZvciBub3ciDQrlj5Hku7bkurrvvJpDaHJpc3RpYW4gS8O2bmlnDQrmlLbku7bkurrv
vJoiWmhvdSwgRGF2aWQoQ2h1bk1pbmcpIiAsYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CuaKhOmAge+8mg0KDQpKdXN0IHRvIGRvdWJsZSBjaGVjazogV2UgZG8gaGF2ZSB0aGF0IGVuYWJs
ZWQgaW4gdGhlIERLTVMgcGFja2FnZSBmb3IgYQ0Kd2hpbGUgYW5kIGRvZXNuJ3QgZW5jb3VudGVy
IGFueSBtb3JlIHByb2JsZW1zIHdpdGggaXQsIGNvcnJlY3Q/DQoNClRoYW5rcywNCkNocmlzdGlh
bi4NCg0KQW0gMTIuMDkuMTkgdW0gMTY6MDIgc2NocmllYiBDaHVubWluZyBaaG91Og0KPiBSQiBv
biBpdCB0byBnbyBhaGVhZC4NCj4NCj4gLURhdmlkDQo+DQo+IOWcqCAyMDE5LzkvMTIgMTg6MTUs
IENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGTOg0KPj4gVGhpcyByZXZlcnRzIGNvbW1pdCBhMjEzYzJj
N2UyMzVjZmMwZTBhMTYxYTU1OGY3ZmRmMmZiM2E2MjRhLg0KPj4NCj4+IFRoZSBjaGFuZ2VzIHRv
IGZpeCB0aGlzIHNob3VsZCBoYXZlIGxhbmRlZCBpbiA1LjEuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4gLS0tDQo+
PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDIgLS0NCj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jDQo+PiBpbmRleCA0ODM0OWU0ZjA3MDEuLmZkM2ZiYWE3M2ZhMyAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPj4gQEAgLTYw
MywxNCArNjAzLDEyIEBAIHZvaWQgYW1kZ3B1X3ZtX21vdmVfdG9fbHJ1X3RhaWwoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsDQo+PiAgICAgICBzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiA9
IGFkZXYtPm1tYW4uYmRldi5nbG9iOw0KPj4gICAgICAgc3RydWN0IGFtZGdwdV92bV9ib19iYXNl
ICpib19iYXNlOw0KPj4NCj4+IC0jaWYgMA0KPj4gICAgICAgaWYgKHZtLT5idWxrX21vdmVhYmxl
KSB7DQo+PiAgICAgICAgICAgICAgIHNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4gICAg
ICAgICAgICAgICB0dG1fYm9fYnVsa19tb3ZlX2xydV90YWlsKCZ2bS0+bHJ1X2J1bGtfbW92ZSk7
DQo+PiAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+PiAgICAg
ICAgICAgICAgIHJldHVybjsNCj4+ICAgICAgIH0NCj4+IC0jZW5kaWYNCj4+DQo+PiAgICAgICBt
ZW1zZXQoJnZtLT5scnVfYnVsa19tb3ZlLCAwLCBzaXplb2Yodm0tPmxydV9idWxrX21vdmUpKTsN
Cj4+DQoNCg==

--_000_ayyik7bhm0thf76qzcrx4nuhoz097fqib6yd00kkml8swdjbb0hlq6h_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+DQo8IS0tIGNvbnZlcnRlZCBmcm9tIHRleHQg
LS0+PHN0eWxlPjwhLS0gLkVtYWlsUXVvdGUgeyBtYXJnaW4tbGVmdDogMXB0OyBwYWRkaW5nLWxl
ZnQ6IDRwdDsgYm9yZGVyLWxlZnQ6ICM4MDAwMDAgMnB4IHNvbGlkOyB9IC0tPjwvc3R5bGU+DQo8
L2hlYWQ+DQo8Ym9keT4NCjxkaXY+SSBkb250IGtub3cgZGttcyBzdGF0dXPvvIxhbnl3YXksIHdl
IHNob3VsZCBzdWJtaXQgdGhpcyBvbmUgYXMgZWFybHkgYXMgcG9zc2libGUuPGJyPg0KPGJyPg0K
LS0tLS0tLS0g5Y6f5aeL6YKu5Lu2IC0tLS0tLS0tPGJyPg0K5Li76aKY77yaUmU6IFtQQVRDSF0g
ZHJtL2FtZGdwdTogcmVzdmVydCAmcXVvdDtkaXNhYmxlIGJ1bGsgbW92ZXMgZm9yIG5vdyZxdW90
Ozxicj4NCuWPkeS7tuS6uu+8mkNocmlzdGlhbiBLw7ZuaWcgPGJyPg0K5pS25Lu25Lq677yaJnF1
b3Q7WmhvdSwgRGF2aWQoQ2h1bk1pbmcpJnF1b3Q7ICxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzxicj4NCuaKhOmAge+8mjxicj4NCjxicj4NCjwvZGl2Pg0KPGZvbnQgc2l6ZT0iMiI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPkp1c3Qg
dG8gZG91YmxlIGNoZWNrOiBXZSBkbyBoYXZlIHRoYXQgZW5hYmxlZCBpbiB0aGUgREtNUyBwYWNr
YWdlIGZvciBhDQo8YnI+DQp3aGlsZSBhbmQgZG9lc24ndCBlbmNvdW50ZXIgYW55IG1vcmUgcHJv
YmxlbXMgd2l0aCBpdCwgY29ycmVjdD88YnI+DQo8YnI+DQpUaGFua3MsPGJyPg0KQ2hyaXN0aWFu
Ljxicj4NCjxicj4NCkFtIDEyLjA5LjE5IHVtIDE2OjAyIHNjaHJpZWIgQ2h1bm1pbmcgWmhvdTo8
YnI+DQomZ3Q7IFJCIG9uIGl0IHRvIGdvIGFoZWFkLjxicj4NCiZndDs8YnI+DQomZ3Q7IC1EYXZp
ZDxicj4NCiZndDs8YnI+DQomZ3Q7IOWcqCAyMDE5LzkvMTIgMTg6MTUsIENocmlzdGlhbiBLw7Zu
aWcg5YaZ6YGTOjxicj4NCiZndDsmZ3Q7IFRoaXMgcmV2ZXJ0cyBjb21taXQgYTIxM2MyYzdlMjM1
Y2ZjMGUwYTE2MWE1NThmN2ZkZjJmYjNhNjI0YS48YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7
IFRoZSBjaGFuZ2VzIHRvIGZpeCB0aGlzIHNob3VsZCBoYXZlIGxhbmRlZCBpbiA1LjEuPGJyPg0K
Jmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnICZs
dDtjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20mZ3Q7PGJyPg0KJmd0OyZndDsgLS0tPGJyPg0KJmd0
OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMgfCAyIC0tPGJyPg0KJmd0OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsgMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pPGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYzxicj4NCiZndDsmZ3Q7IGluZGV4IDQ4MzQ5ZTRmMDcw
MS4uZmQzZmJhYTczZmEzIDEwMDY0NDxicj4NCiZndDsmZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jPGJyPg0KJmd0OyZndDsgJiM0MzsmIzQzOyYjNDM7IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmM8YnI+DQomZ3Q7Jmd0OyBAQCAt
NjAzLDE0ICYjNDM7NjAzLDEyIEBAIHZvaWQgYW1kZ3B1X3ZtX21vdmVfdG9fbHJ1X3RhaWwoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsPGJyPg0KJmd0OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2IgPSBhZGV2LSZndDtt
bWFuLmJkZXYuZ2xvYjs8YnI+DQomZ3Q7Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyBzdHJ1Y3QgYW1kZ3B1X3ZtX2JvX2Jhc2UgKmJvX2Jhc2U7PGJyPg0KJmd0OyZndDsm
bmJzcDsmbmJzcDsmbmJzcDsgPGJyPg0KJmd0OyZndDsgLSNpZiAwPGJyPg0KJmd0OyZndDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKHZtLSZndDtidWxrX21vdmVhYmxl
KSB7PGJyPg0KJmd0OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc3Bpbl9sb2NrKCZh
bXA7Z2xvYi0mZ3Q7bHJ1X2xvY2spOzxicj4NCiZndDsmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHR0bV9ib19idWxrX21vdmVfbHJ1X3RhaWwoJmFtcDt2bS0mZ3Q7bHJ1X2J1bGtfbW92
ZSk7PGJyPg0KJmd0OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc3Bpbl91bmxvY2so
JmFtcDtnbG9iLSZndDtscnVfbG9jayk7PGJyPg0KJmd0OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgcmV0dXJuOzxicj4NCiZndDsmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IH08YnI+DQomZ3Q7Jmd0OyAtI2VuZGlmPGJyPg0KJmd0OyZndDsmbmJzcDsmbmJz
cDsmbmJzcDsgPGJyPg0KJmd0OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgbWVtc2V0KCZhbXA7dm0tJmd0O2xydV9idWxrX21vdmUsIDAsIHNpemVvZih2bS0mZ3Q7bHJ1
X2J1bGtfbW92ZSkpOzxicj4NCiZndDsmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxicj4NCjxicj4N
CjwvZGl2Pg0KPC9zcGFuPjwvZm9udD4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_ayyik7bhm0thf76qzcrx4nuhoz097fqib6yd00kkml8swdjbb0hlq6h_--

--===============0314188948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0314188948==--
