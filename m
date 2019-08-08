Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE185D05
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 10:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59BA6E6A5;
	Thu,  8 Aug 2019 08:38:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740073.outbound.protection.outlook.com [40.107.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F3D6E6A5
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 08:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejEnWKvnKy2RCrl8V0j23/n/EGWdamOKkftKOFqHX4vXVlOvAT7dPUSEnAwwkpe18mS3ON0tOPhtOvl8fOXjwQ3gHotrLDDXzbNrCXSjhsYsGgjdFvilwNCdVR7LQFsgTWyhnOdXg4IGV2ETK1wOFpivKp5qflBTOdo/ZXno4lYK91m2+y9DArOpeZ2djElQ0zNpVwoDpqyXBMu3mKvYJ0H9Ag8z629y5PTQbn4J1ODuevF6QGXgoRC67TW2AOpKShbf0nmxQvxqbMmHD0voGIP9hzcjBxcjYSe4G6AvvFUvrGSesPLsUhvg+D/749FsQOFoj1den9tbCJ92iVq3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzTApYqjiKnRtLWB672OHsR6USxE+Cj2fGQGAf6UUMU=;
 b=P/MnQMEeHWikSP6bUX8uI9iVqssBUUjrw2k6tfYvyZ4D18W0tefTtBB7B47hp3Uo4XsIBCPHI0SQ8+DbNPnWMYEZ0igoc7qHnNIkt1CSW23yUZkRtptdh42pJHH4LIEJV4fP9+RjThX7dIOH+FmrrbnTNlH+Tmb0EIGPoRRMdJmalZkU03NOvhl24OZDPtRoRXIrajbPkh74RFLa9t7PSS2dinJpIDuT0eunCSHtShPrMIjwFLjlYZ/52uYXjTjO13FrPkAB4sZTHCau7BIfsFzjKjEluVCwlZo9xAeHfh32TTQcMqwZa94zVQ6VMb9l7rIbocVOWzMVwkdHRx30iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2405.namprd12.prod.outlook.com (52.132.141.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 08:38:34 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 08:38:34 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH] drm/amdgpu: add sub block parameter in ras inject command
Thread-Topic: [PATCH] drm/amdgpu: add sub block parameter in ras inject command
Thread-Index: AQHVTbVLxdib2EUFD0e9CwSvTETpzabw7c9Q
Date: Thu, 8 Aug 2019 08:38:34 +0000
Message-ID: <DM5PR12MB1418487EF8BEDEE3EC16AE3AFCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190808064802.32759-1-tao.zhou1@amd.com>
In-Reply-To: <20190808064802.32759-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc98876b-09af-4263-469f-08d71bdbccc6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2405; 
x-ms-traffictypediagnostic: DM5PR12MB2405:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB24052D1652BBB036517F6B44FCD70@DM5PR12MB2405.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:419;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(13464003)(14454004)(9686003)(6306002)(4326008)(66066001)(53936002)(316002)(110136005)(305945005)(7736002)(3846002)(478600001)(6246003)(33656002)(229853002)(8676002)(8936002)(25786009)(81156014)(6116002)(81166006)(966005)(256004)(6436002)(55016002)(64756008)(66446008)(66476007)(6636002)(2906002)(66946007)(446003)(76116006)(66556008)(71190400001)(5660300002)(86362001)(71200400001)(52536014)(7696005)(76176011)(186003)(74316002)(476003)(102836004)(486006)(26005)(53546011)(6506007)(2501003)(99286004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2405;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ifDG5EbXb44/8sxuyjc+0G9bBRa1stefFMI67x+aGIJk31FLwR/U4lVxzZtHd1iJ4O9ua7HUBNMKU4+4GcphINT9Kn1VDS8gabjeabe/4dEHEFxfUfLsODGYYXKbJ28thBcP4+h22TLjqinDJhbdLQiyH/Ub85XasiImpaSWFQbrsmOLmy4zSmQnS4g05b397rzBpoJAagywxzrIDqeZ1di/QLU2agN/91Uudpqv3WAuZtRjjc5GkjdkggqoecgWYQVumEobd606y4WnY/mezMNJWHqlGIigbO1tajnkRFe6K65Wqg2PWci2POSwX7wjAbrG9vl60pzmCx8Oj+GaRKD6vMamHIkC+PNzqQTyJoNJomczvjwkKVNCRvtWtuLAHCI5Le+k6smaOLpLIlzB6/NpdmwXoko5+5MvLiTDySA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc98876b-09af-4263-469f-08d71bdbccc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 08:38:34.2129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzTApYqjiKnRtLWB672OHsR6USxE+Cj2fGQGAf6UUMU=;
 b=ED8PwlOz3Jwfnz8Mf1I/y20lLeVhOA0RHhhPZ/v4NNJjAx1R78ulpWRwaQKAA3bFX/niRZvE+i2myyrOu0HzVZY9d2CQKHnrpZOG9dY6XORSQzibDcUWH5cjPNXOwxTugeDCwGfVzkErjAW+pyZLFO7yCHqWVVDIXm/z+X7jEXo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGFv
IFpob3UNClNlbnQ6IDIwMTnlubQ45pyIOOaXpSAxNDo0OA0KVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgQ2hl
biwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFt
ZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPg0KQ2M6IFpob3UxLCBUYW8g
PFRhby5aaG91MUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBhZGQgc3Vi
IGJsb2NrIHBhcmFtZXRlciBpbiByYXMgaW5qZWN0IGNvbW1hbmQNCg0KcmFzIHN1YiBibG9jayBp
bmRleCBjb3VsZCBiZSBwYXNzZWQgZnJvbSBzaGVsbCBjb21tYW5kDQoNClNpZ25lZC1vZmYtYnk6
IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDE3ICsrKysrKysrKystLS0tLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMNCmluZGV4IDM2OTY1MTI0N2IyMy4uYmM3NjZjZGJlYWFlIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCkBAIC0xMjksNiArMTI5
LDcgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9wYXJzZV9kYXRhKHN0cnVj
dCBmaWxlICpmLA0KIAljaGFyIGVycls5XSA9ICJ1ZSI7DQogCWludCBvcCA9IC0xOw0KIAlpbnQg
YmxvY2tfaWQ7DQorCXVpbnQzMl90IHN1Yl9ibG9jazsNCiAJdTY0IGFkZHJlc3MsIHZhbHVlOw0K
IA0KIAlpZiAoKnBvcykNCkBAIC0xNjcsMTEgKzE2OCwxMiBAQCBzdGF0aWMgaW50IGFtZGdwdV9y
YXNfZGVidWdmc19jdHJsX3BhcnNlX2RhdGEoc3RydWN0IGZpbGUgKmYsDQogCQlkYXRhLT5vcCA9
IG9wOw0KIA0KIAkJaWYgKG9wID09IDIpIHsNCi0JCQlpZiAoc3NjYW5mKHN0ciwgIiUqcyAlKnMg
JSpzICVsbHUgJWxsdSIsDQotCQkJCQkJJmFkZHJlc3MsICZ2YWx1ZSkgIT0gMikNCi0JCQkJaWYg
KHNzY2FuZihzdHIsICIlKnMgJSpzICUqcyAweCVsbHggMHglbGx4IiwNCi0JCQkJCQkJJmFkZHJl
c3MsICZ2YWx1ZSkgIT0gMikNCisJCQlpZiAoc3NjYW5mKHN0ciwgIiUqcyAlKnMgJSpzICV1ICVs
bHUgJWxsdSIsDQorCQkJCQkJJnN1Yl9ibG9jaywgJmFkZHJlc3MsICZ2YWx1ZSkgIT0gMykNCisJ
CQkJaWYgKHNzY2FuZihzdHIsICIlKnMgJSpzICUqcyAweCV4IDB4JWxseCAweCVsbHgiLA0KKwkJ
CQkJCQkmc3ViX2Jsb2NrLCAmYWRkcmVzcywgJnZhbHVlKSAhPSAzKQ0KIAkJCQkJcmV0dXJuIC1F
SU5WQUw7DQorCQkJZGF0YS0+aGVhZC5zdWJfYmxvY2tfaW5kZXggPSBzdWJfYmxvY2s7DQogCQkJ
ZGF0YS0+aW5qZWN0LmFkZHJlc3MgPSBhZGRyZXNzOw0KIAkJCWRhdGEtPmluamVjdC52YWx1ZSA9
IHZhbHVlOw0KIAkJfQ0KQEAgLTIxNiw3ICsyMTgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNf
ZGVidWdmc19jdHJsX3BhcnNlX2RhdGEoc3RydWN0IGZpbGUgKmYsDQogICogd3JpdGUgdGhlIHN0
cnVjdCB0byB0aGUgY29udHJvbCBub2RlLg0KICAqDQogICogYmFzaDoNCi0gKiBlY2hvIG9wIGJs
b2NrIFtlcnJvciBbYWRkcmVzcyB2YWx1ZV1dID4gLi4uL3Jhcy9yYXNfY3RybA0KKyAqIGVjaG8g
b3AgYmxvY2sgW2Vycm9yIFtzdWJfYmxjb2sgYWRkcmVzcyB2YWx1ZV1dID4gLi4uL3Jhcy9yYXNf
Y3RybA0KICAqCW9wOiBkaXNhYmxlLCBlbmFibGUsIGluamVjdA0KICAqCQlkaXNhYmxlOiBvbmx5
IGJsb2NrIGlzIG5lZWRlZA0KICAqCQllbmFibGU6IGJsb2NrIGFuZCBlcnJvciBhcmUgbmVlZGVk
DQpAQCAtMjI2LDEwICsyMjgsMTEgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2RlYnVnZnNfY3Ry
bF9wYXJzZV9kYXRhKHN0cnVjdCBmaWxlICpmLA0KICAqCWVycm9yOiB1ZSwgY2UNCiAgKgkJdWU6
IG11bHRpX3VuY29ycmVjdGFibGUNCiAgKgkJY2U6IHNpbmdsZV9jb3JyZWN0YWJsZQ0KKyAqCXN1
Yl9ibG9jazogc3ViIGJsb2NrIGluZGV4LCBwYXNzIDAgaWYgdGhlcmUgaXMgbm8gc3ViIGJsb2Nr
DQogICoNCiAgKiBoZXJlIGFyZSBzb21lIGV4YW1wbGVzIGZvciBiYXNoIGNvbW1hbmRzLA0KLSAq
CWVjaG8gaW5qZWN0IHVtYyB1ZSAweDAgMHgwID4gL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvcmFz
L3Jhc19jdHJsDQotICoJZWNobyBpbmplY3QgdW1jIGNlIDAgMCA+IC9zeXMva2VybmVsL2RlYnVn
L2RyaS8wL3Jhcy9yYXNfY3RybA0KKyAqCWVjaG8gaW5qZWN0IHVtYyB1ZSAweDAgMHgwIDB4MCA+
IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3Jhcy9yYXNfY3RybA0KKyAqCWVjaG8gaW5qZWN0IHVt
YyBjZSAwIDAgMCA+IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3Jhcy9yYXNfY3RybA0KICAqCWVj
aG8gZGlzYWJsZSB1bWMgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC9yYXMvcmFzX2N0cmwNCiAg
Kg0KICAqIEhvdyB0byBjaGVjayB0aGUgcmVzdWx0Pw0KLS0gDQoyLjE3LjENCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBs
aXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
