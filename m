Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D9B07D2
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86316EC33;
	Thu, 12 Sep 2019 04:13:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A496E029
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 03:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNAUr7JjaGEQwVkt3mdSrrNpFjc8ldo2P5+GMAckTQzpMAxwFJIMzPiWCRAgRTq0Nk0eyE8jQh1gt9riacCYka8i1AOJAHTi78IgHcSbpatOJ5rBmeoGT6GVI4GPUjK/E5MZpr1LRHFlM6w42FUpcvvpahPw0q8EcJDci7YMFe6QIYnYGfJEmKWCtC8Sp3h0+BwMnkvLt2wbdjkPmd+Ksj+p8lH1ovYbPPUi1nX8Jt6AP80h+iQRhdoPeZnLIXVgg10PLlNArosVix4M5qHlx3gvbzjN48FKDbbCMTSKnqQ/oylieKg5SnqerOkyeDRndjR4R0m3lzcd1jKlBbLxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGvBhUtpT+k1ERMM2GjYBJ8QAUdfVx+pKYFOqcjlzZU=;
 b=euP1ZCPPFyrNRkyb89nLAjhPiuyFPvnAAP/X1pQWVIMi7iToGwF2UiLcOOr9CyvQChELVeOsszqCEjtAXyecqBxu+8OUs9AlkDLaz+Zf/nhNKcR2H3MKDR8IBWLzlPpJU+3EIgY4veShqmJMJbLS/O2UkqOHp2urw2WjYVZ0v6dZGzJAVfcJt39TFQ1tDNDt8STUK14ok4sSh7bUAAwCUGX0MWinkWZT6kwDNqWY8RN4UymrFtE6cTNzzFEypBvxdrNF6yTfOefDuYG7RC/v+swVCgBkiPJD/Di2CwYYVFDbpmTQe8cy0YSIuZSHgzM09sRpQEtvnoKCpRpzUhWWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4157.namprd12.prod.outlook.com (52.135.50.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Thu, 12 Sep 2019 03:04:13 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 03:04:13 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Zhao, Jiange" <Jiange.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: For Navi12 SRIOV VF, register mailbox
 functions
Thread-Topic: [PATCH] drm/amdgpu: For Navi12 SRIOV VF, register mailbox
 functions
Thread-Index: AQHVaIs71/Jv2lsjmkqBRP7gzXFheacnXEbw
Date: Thu, 12 Sep 2019 03:04:13 +0000
Message-ID: <MN2PR12MB2975D13C358961B784D1E3278FB00@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <20190911102505.5480-1-jianzh@amd.com>
In-Reply-To: <20190911102505.5480-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56e99960-552c-4e6b-5636-08d7372de421
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4157; 
x-ms-traffictypediagnostic: MN2PR12MB4157:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4157383212EA49F2F8F661B98FB00@MN2PR12MB4157.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(189003)(199004)(13464003)(446003)(6436002)(33656002)(7696005)(3846002)(14444005)(14454004)(6506007)(76116006)(64756008)(6116002)(66446008)(66066001)(256004)(476003)(25786009)(2906002)(478600001)(486006)(186003)(6246003)(4326008)(76176011)(7736002)(11346002)(99286004)(74316002)(66946007)(66556008)(102836004)(26005)(110136005)(316002)(229853002)(54906003)(5660300002)(81166006)(8936002)(52536014)(86362001)(53936002)(2501003)(8676002)(55016002)(15650500001)(9686003)(81156014)(305945005)(71200400001)(71190400001)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4157;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T3CtKnZ6ttSc/Pjr5tpkd4BmN8aFyh4kyqdWnKHbMocGjmPfScriE0pkleRtaCX/8E20JSO0L2LQ3zaIWbjGv17jzihZJ4e8CfTt1mwGTSvK6CR+qNEHcvdujtLjrGQEwqc1sh1JdtuOQ+XbZ+4ZvviyodfqdvjxdJagiCfXELfJbJfro9kOzmrnyvSLKfsS6OE6piZb+JdOPHeAaME6Xsig3O+aAQV8OiLmcI8k+XW3PO+AyOXkuS9HdH9s0/A8P4nDvc/zPCohAtd8r8xkNTkGRhYLKOIkJjVEVSUibZKZmLPFAG3NxARvUkBC5u/l9dCI2afxe0nLuvE6S3ZveT9de/6Q00UWRjAH9knp+gyht6qmH0usr5WoHlzYlRvSCpgArO1khmgmKTV2EkWBQw2/noqZtc7zZIBGLtUsPOY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e99960-552c-4e6b-5636-08d7372de421
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 03:04:13.5021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: haHP6Xy+67RLR0OiISksLEA9oJXDMgs/T8v08MtQA3DYUGWBVerCV2863yybv0SS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGvBhUtpT+k1ERMM2GjYBJ8QAUdfVx+pKYFOqcjlzZU=;
 b=slf+mOioIgNxkOvHUOxOS38l1VETa6T2Zk5jJavXu3mwJoe9In2GoB/7RR9n8Cgzl/IuU+Um1pb4xD4c4fqZ255w+UaKfWOcl+hPAJLwSEe07WrwM9T4elWHO/cNiosy3zh5QhWxV0eKsowc1mPGQTwS++qfw94Di4dhliSpuK8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "Nieto,
 David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4KCj4tLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+RnJvbTogWmhhbywgSmlhbmdlIDxKaWFuZ2UuWmhhb0BhbWQuY29t
Pgo+U2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMTkgNjoyNSBQTQo+VG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj5DYzogTmlldG8sIERhdmlkIE0gPERhdmlkLk5pZXRv
QGFtZC5jb20+OyBEZW5nLCBFbWlseQo+PEVtaWx5LkRlbmdAYW1kLmNvbT47IEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Owo+WmhhbywgSmlhbmdlIDxKaWFuZ2Uu
Wmhhb0BhbWQuY29tPgo+U3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBGb3IgTmF2aTEyIFNS
SU9WIFZGLCByZWdpc3RlciBtYWlsYm94Cj5mdW5jdGlvbnMKPgo+RnJvbTogSmlhbmdlIFpoYW8g
PEppYW5nZS5aaGFvQGFtZC5jb20+Cj4KPk1haWxib3ggZnVuY3Rpb25zIGFuZCBpbnRlcnJ1cHRz
IGFyZSBvbmx5IGZvciBOYXZpMTIgVkYuCj4KPlJlZ2lzdGVyIGZ1bmN0aW9ucyBhbmQgaXJxcyBk
dXJpbmcgaW5pdGlhbGl6YXRpb24uCj4KPlNpZ25lZC1vZmYtYnk6IEppYW5nZSBaaGFvIDxKaWFu
Z2UuWmhhb0BhbWQuY29tPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8
IDE5ICsrKysrKysrKysrKysrKysrKysKPiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwo+Yi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGluZGV4IGE2MWY0M2MwYzlkZi4uNGMyNDY3MmJl
MTJhCj4xMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKPisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKPkBAIC01Myw2ICs1Myw3IEBACj4gI2lu
Y2x1ZGUgInZjbl92Ml8wLmgiCj4gI2luY2x1ZGUgImRjZV92aXJ0dWFsLmgiCj4gI2luY2x1ZGUg
Im1lc192MTBfMS5oIgo+KyNpbmNsdWRlICJteGdwdV9udi5oIgo+Cj4gc3RhdGljIGNvbnN0IHN0
cnVjdCBhbWRfaXBfZnVuY3MgbnZfY29tbW9uX2lwX2Z1bmNzOwo+Cj5AQCAtNDI2LDYgKzQyNyw5
IEBAIGludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+Cj4g
CWFkZXYtPm5iaW8uZnVuY3MtPmRldGVjdF9od192aXJ0KGFkZXYpOwo+Cj4rCWlmIChhbWRncHVf
c3Jpb3ZfdmYoYWRldikpCj4rCQlhZGV2LT52aXJ0Lm9wcyA9ICZ4Z3B1X252X3ZpcnRfb3BzOwo+
Kwo+IAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewo+IAljYXNlIENISVBfTkFWSTEwOgo+IAlj
YXNlIENISVBfTkFWSTE0Ogo+QEAgLTY2NiwxNiArNjcwLDMxIEBAIHN0YXRpYyBpbnQgbnZfY29t
bW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQo+IAkJcmV0dXJuIC1FSU5WQUw7Cj4gCX0KPgo+
KwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7Cj4rCQlhbWRncHVfdmlydF9pbml0X3NldHRp
bmcoYWRldik7Cj4rCQl4Z3B1X252X21haWxib3hfc2V0X2lycV9mdW5jcyhhZGV2KTsKPisJfQo+
Kwo+IAlyZXR1cm4gMDsKPiB9Cj4KPiBzdGF0aWMgaW50IG52X2NvbW1vbl9sYXRlX2luaXQodm9p
ZCAqaGFuZGxlKSAgewo+KwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqKWhhbmRsZTsKPisKPisJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKPisJ
CXhncHVfbnZfbWFpbGJveF9nZXRfaXJxKGFkZXYpOwo+Kwo+IAlyZXR1cm4gMDsKPiB9Cj4KPiBz
dGF0aWMgaW50IG52X2NvbW1vbl9zd19pbml0KHZvaWQgKmhhbmRsZSkgIHsKPisJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Cj4rCj4r
CWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4rCQl4Z3B1X252X21haWxib3hfYWRkX2lycV9p
ZChhZGV2KTsKPisKPiAJcmV0dXJuIDA7Cj4gfQo+Cj4tLQo+Mi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
