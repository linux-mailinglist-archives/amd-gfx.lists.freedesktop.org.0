Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E8BDED76
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 15:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0E6E0BE;
	Mon, 21 Oct 2019 13:23:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C1E6E0BE
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 13:23:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESkE9O73KulYnE/efFhqvLSKnQaSqn6Dc8l7vHVvckPuOeAjZQ2qakYvBhjzyuPsXky25VabbuHOKjrBXtXiOQofv9jETagL8TsmGQVILXFAzhLG47dGFxUQBvYkMjcdMZGDouUFBCUw5nAUcxvreIsC5puG8rF2cdaim9QxG8GKhYQCzKWj03Juf/RGQ2O5phmdTeKkRpdweSfIinHrlpx9+FALsmoZN8rpLCW1Lcm553lR4SXxp+PTYYqhrOKsVs0/gH4KYok0ONdyX7LvGIUll6mZgM9viAlb/ROIkNYfYQqkFLdymkkD8vxzeWlQtt8L9ddvM3RZ9SvkKSW+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgjJ9Y6dZ3LJEUg1X7GvQ0AoKlXZflDVnhcd2WDmr9g=;
 b=d0Hz5XEdrBC7/ZeKAMsGxZaWd7gNZzL9VVMJr48odjwuKl3Y+S/V/QaBC1cs3cTAueZdEW5RVJWyUqitmoo8+wts9VicHczCEefKDjatVjINdGGZiVopZRRS0MxRka2qGH6O2yAZP/MhsIujh+SqVcjnp3PiT0R30EsVV+b2+v0QHvPdG9oM3tQF6BpAIhIBRNwjM+MfoVY4i+n0IPburhQhIUMK/PVxnzdH1afXPFUcnfoyPf4HzzHR/IjI+oIP3ID946YR7bIrHBrPF7L1wwtmf5YtLGSnHTD3+gIlTqgHVcnmis9pQYz4zw+XtCYoX6NxE6VtWulz1klpesiJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1410.namprd12.prod.outlook.com (10.168.225.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Mon, 21 Oct 2019 13:23:53 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.029; Mon, 21 Oct
 2019 13:23:53 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/4] drm/amdgpu: Use ARCTURUS in RAS EEPROM.
Thread-Topic: [PATCH 3/4] drm/amdgpu: Use ARCTURUS in RAS EEPROM.
Thread-Index: AQHVhfWYWaX4PyoTYkKNYRwB1mqyJKdlGZSA
Date: Mon, 21 Oct 2019 13:23:53 +0000
Message-ID: <BN6PR12MB18093DA08204F84F2E35C501F7690@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
 <1571431711-30149-4-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1571431711-30149-4-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7090d098-cc09-4cf7-a6b2-08d75629eb65
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1410:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1410327F7352353F560140CEF7690@BN6PR12MB1410.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(13464003)(305945005)(7736002)(6116002)(3846002)(74316002)(6246003)(4326008)(7696005)(99286004)(71200400001)(76176011)(71190400001)(110136005)(54906003)(316002)(6436002)(9686003)(229853002)(55016002)(2906002)(25786009)(478600001)(81156014)(81166006)(8676002)(8936002)(86362001)(446003)(14454004)(33656002)(52536014)(5660300002)(6506007)(53546011)(102836004)(26005)(14444005)(256004)(2501003)(66066001)(486006)(76116006)(64756008)(66556008)(66476007)(66946007)(66446008)(11346002)(476003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1410;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iu6fk8uZh/F5ZUQ/fduieeSaWyNRTIvlCVSlutAWUcMN7+hwBU2FQSXhLPzOCXpHCMKToaQ97frb6evqE49sf+7P0B/sYv7rxYJ8S9mIzkqPd7FaCb5ioQhOHBHNKY8QBMgPnbCxcMFV906O4VwYeyxG5+2nAIrOG7mkDQPsrxNJR9FaQUw/SMQM5MIJVhWgBl4+xQ9a8WWoqO5YqZyI8vWPa46zu+NjnBU+8/LDHlPJD1r6xMSbPhuhibTjODQus2y7nswEgPmiB1QKbvRR+Ifuv0ffEyHst4/gwNSw4cHgXQ6TmYDMdnu+3IVAHQtOiTfvxoAxhnqV+qd0Q6X4ph3FDKddjgXX35fj85XaG/AMvAm1bivjUDxKxP90r1wX/KAEAMoXsGi5ZUwoxZ45/5ebpH602a1geTFK0odAu0IfFKlQyZ1x2huuz8U6hwLQ
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7090d098-cc09-4cf7-a6b2-08d75629eb65
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 13:23:53.8620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l2tGiuffuXpSYVxwIp9dVuEHAg642XnnRCdCoRhaQke8LhBiXeqf1RzZRfMsCVHY8NE5wp1o/teB6MjnlzL1kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgjJ9Y6dZ3LJEUg1X7GvQ0AoKlXZflDVnhcd2WDmr9g=;
 b=f/s/V/OIuw7O7Zwd0VjFPSJr3k0PBAs8a8wZ59gnFJkod3T76fZO0uEuQL/yFYGyRxD5ctfbxnY7UJeI1he5/Fu3VH9TcsnkyjUEQCaAnBbImLKph598hX2xAIC8tt7CnbTFa/HP9Nbgyj0MZcEITPnyy5Hqp2T/PwizeaiMt8w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>,
 "noreply-confluence@amd.com" <noreply-confluence@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFuZHJleSBHcm9kem92c2t5IDxh
bmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxOCwgMjAx
OSA0OjQ5IFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IENoZW4s
IEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpob3UxLCBUYW8KPiA8VGFvLlpob3UxQGFt
ZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIKPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IG5vcmVwbHktY29uZmx1ZW5jZUBhbWQuY29tOyBRdWFuLAo+IEV2YW4gPEV2YW4uUXVhbkBhbWQu
Y29tPjsgR3JvZHpvdnNreSwgQW5kcmV5Cj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+Cj4g
U3ViamVjdDogW1BBVENIIDMvNF0gZHJtL2FtZGdwdTogVXNlIEFSQ1RVUlVTIGluIFJBUyBFRVBS
T00uCj4gCgpQbGVhc2UgYWRkIGEgcGF0Y2ggZGVzY3JpcHRpb24uICBXaXRoIHRoYXQgZml4ZWQ6
ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJv
bS5jIHwgOSArKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzX2VlcHJvbS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzX2VlcHJvbS5jCj4gaW5kZXggMjBhZjBhMS4uN2RlMTZjMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYwo+IEBAIC0yMTYsNiArMjE2
LDEwIEBAIGludCBhbWRncHVfcmFzX2VlcHJvbV9pbml0KHN0cnVjdAo+IGFtZGdwdV9yYXNfZWVw
cm9tX2NvbnRyb2wgKmNvbnRyb2wpCj4gIAkJcmV0ID0gc211X3YxMV8wX2kyY19lZXByb21fY29u
dHJvbF9pbml0KCZjb250cm9sLQo+ID5lZXByb21fYWNjZXNzb3IpOwo+ICAJCWJyZWFrOwo+IAo+
ICsJY2FzZSBDSElQX0FSQ1RVUlVTOgo+ICsJCXJldCA9IHNtdV9pMmNfZWVwcm9tX2luaXQoJmFk
ZXYtPnNtdSwgJmNvbnRyb2wtCj4gPmVlcHJvbV9hY2Nlc3Nvcik7Cj4gKwkJYnJlYWs7Cj4gKwo+
ICAJZGVmYXVsdDoKPiAgCQlyZXR1cm4gMDsKPiAgCX0KPiBAQCAtMjYwLDYgKzI2NCw5IEBAIHZv
aWQgYW1kZ3B1X3Jhc19lZXByb21fZmluaShzdHJ1Y3QKPiBhbWRncHVfcmFzX2VlcHJvbV9jb250
cm9sICpjb250cm9sKQo+ICAJY2FzZSBDSElQX1ZFR0EyMDoKPiAgCQlzbXVfdjExXzBfaTJjX2Vl
cHJvbV9jb250cm9sX2ZpbmkoJmNvbnRyb2wtCj4gPmVlcHJvbV9hY2Nlc3Nvcik7Cj4gIAkJYnJl
YWs7Cj4gKwljYXNlIENISVBfQVJDVFVSVVM6Cj4gKwkJc211X2kyY19lZXByb21fZmluaSgmYWRl
di0+c211LCAmY29udHJvbC0KPiA+ZWVwcm9tX2FjY2Vzc29yKTsKPiArCQlicmVhazsKPiAKPiAg
CWRlZmF1bHQ6Cj4gIAkJcmV0dXJuOwo+IEBAIC0zNjQsNyArMzcxLDcgQEAgaW50IGFtZGdwdV9y
YXNfZWVwcm9tX3Byb2Nlc3NfcmVjb2RzKHN0cnVjdAo+IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRy
b2wgKmNvbnRyb2wsCj4gIAlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkOwo+ICAJ
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOwo+
IAo+IC0JaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX1ZFR0EyMCkKPiArCWlmIChhZGV2LT5h
c2ljX3R5cGUgIT0gQ0hJUF9WRUdBMjAgJiYgYWRldi0+YXNpY190eXBlICE9Cj4gQ0hJUF9BUkNU
VVJVUykKPiAgCQlyZXR1cm4gMDsKPiAKPiAgCWJ1ZmZzID0ga2NhbGxvYyhudW0sIEVFUFJPTV9B
RERSRVNTX1NJWkUgKwo+IEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRSwKPiAtLQo+IDIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
