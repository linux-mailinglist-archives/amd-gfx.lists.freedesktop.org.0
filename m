Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43137D60A
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 09:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1B26E3AE;
	Thu,  1 Aug 2019 07:08:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710041.outbound.protection.outlook.com [40.107.71.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600716E3AE
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 07:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSO9Eo0gXRwDKP7kJc3XM4Qw2X+YtoqgjJdVMkW/6KSO9OPpTKegeYCLghqwmw+h3PPLk6Ztu+7AYTDRs+BryzHCBsd8qB91yR7bO63bfLszjldBudFw+c0Dtw0ghZUnnLxorSvgR9Iku2gwZkqw97XUR4P0Td18PcKRwlclRFuwHUu8Dhe6mktYzxN1MMSjnOTVbdRuFrcQSxdMLOKxsO+md0UJ54EPdI9+sldtALGxmiIkFjwOO/qG7Z7zcSpdmBoiNRqEUePTcAweD7fn40yhH7yu02lIgEqUKSbNehcN7j7ZbM7KbrMSjvwh2nzU5f9Ji1u0IivGG6j65IUVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekaB1uQCGHzahnn4QG+AXDZX0lk7M9b8P7hEPHsfOeM=;
 b=k6fdWPiAVsxTrhUfTN5RnARrpI7lToGXgwJRsBOIclE8kS+rcI8VdU1H4fBhGUsw1yPpQ6wreMe1dqfoCH4Rj+EHBYJoQ03M+yV3z8MqsbaGqxsBZNtrXRA604uhj3x4/3MuWMHXrmBOSOmjSSrb4I+VEd+xXqJcXhtPw0pKMWknCIBZJ3RlD1LxsACKYAqgdjzWG3hjpzTBnjrqFRosw6iweRn90wx+v+5jfpVnqX454cWcPQcJMKBq3BmjXxjaDPChGsrio0sQWTF7QrATtr/s13haM/Yk0Ct9rGDevcDgmHYFk653tG/NF4VQcJx0Cl/xwsni8ZQfSrUXj/deSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1819.namprd12.prod.outlook.com (10.175.91.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Thu, 1 Aug 2019 07:08:37 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9562:72ed:ddbe:868c]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9562:72ed:ddbe:868c%6]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 07:08:37 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH 0/6] umc ras code refinement
Thread-Topic: [PATCH 0/6] umc ras code refinement
Thread-Index: AQHVSDRxQhsA5YtxCEKSlLuOiA6mO6bl3zUA
Date: Thu, 1 Aug 2019 07:08:37 +0000
Message-ID: <DM5PR12MB1418A1C5EDAE5D7B6EFFD43BFCDE0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>
In-Reply-To: <20190801064311.7307-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13f37086-1ea6-4076-0822-08d7164f1358
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1819; 
x-ms-traffictypediagnostic: DM5PR12MB1819:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1819A1E007937B173766C9FBFCDE0@DM5PR12MB1819.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(189003)(199004)(13464003)(7696005)(26005)(102836004)(186003)(6246003)(52536014)(5660300002)(4326008)(446003)(6636002)(11346002)(76176011)(316002)(110136005)(3846002)(229853002)(478600001)(6116002)(9686003)(55016002)(6306002)(14454004)(53546011)(6506007)(6436002)(966005)(53936002)(2906002)(71190400001)(71200400001)(64756008)(66556008)(66476007)(66946007)(76116006)(66446008)(25786009)(68736007)(8936002)(81156014)(81166006)(99286004)(8676002)(66066001)(2501003)(486006)(256004)(33656002)(74316002)(476003)(86362001)(305945005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1819;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BNSjY9mZeabxjNIiVtyBkUlZzdRGxJEa3673ByKaUUpgVEGFCMlGrGNV+lGJ533qNXDj70Tw2HJzyUNRPRDx5VIfmgQ9ZAnCYpzoul+qMMFuXoGJHhv4fuY2+BBPsS4x3k9dqce1auRJCiEHW0jlag0IOJzSgU3uoVbOqSRZ/3EjT9FYLMWxK5IKQ0OXCvy+50wvy5UzKpGYlOvnXu33GVTqj469XQ0REDA4ugtSTOM9v5foulFztxPk7fWyNO9Rb4cfNcuQ2N4sjR1GUQMJN/vX1MImcYYYml67x5oQDPol0I/7AI4t0YPKCVQD14u0zoBLfhau/zzljQLanpN0TiY4FV1hJkNrNTnpfq+0XuERg8GfLcPR1I4AYR8u8+I9zFuPRaD2ZdFDsihBw7qWGToX42BJksyeq5K12r/7d+4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f37086-1ea6-4076-0822-08d7164f1358
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 07:08:37.7266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1819
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekaB1uQCGHzahnn4QG+AXDZX0lk7M9b8P7hEPHsfOeM=;
 b=fBfZPp9Pt7/ju49tOAbPssWVIHNoKgMtcyGV+nijGMHaYRfxIkIpZiXs5fUuyqxUt+iH4ETSCckqSrUZJRR1PbrZgI2EevASFJAsLqMp5yAtmRC31ZYeq/RJvWgs2viC1P4uOm6xtsbv5Ko6hNbdLehESK1gETs4PXiUWixycp8=
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

UGxlYXNlIGFkZCBvbmUgbGluZSBkZXNjcmlwdGlvbiBmb3IgcGF0Y2ggIzIgJiAzLiBPdGhlciB0
aGFuIHRoYXQsIHRoZSBzZXJpZXMgaXMNCg0KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVnYXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGFvIFpob3UNClNlbnQ6IDIwMTnlubQ45pyIMeaXpSAx
NDo0Mw0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBD
aGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBh
bkBhbWQuY29tPg0KQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KU3ViamVjdDog
W1BBVENIIDAvNl0gdW1jIHJhcyBjb2RlIHJlZmluZW1lbnQNCg0KVGhlIHNlcmllcyByZWZpbmVz
IHVtYyByYXMgY29kZSwgbm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQoNClRhbyBaaG91ICg2KToNCiAg
ZHJtL2FtZGdwdTogcmVtb3ZlIHRoZSBjbGVhciBvZiBNQ0FfQUREUg0KICBkcm0vYW1kZ3B1OiBh
ZGQgbW9yZSBwYXJhbWV0ZXJzIGFuZCBmdW5jdGlvbnMgdG8gYW1kZ3B1X3VtYyBzdHJ1Y3R1cmUN
CiAgZHJtL2FtZGdwdTogaW5pdGlhbGl6ZSBuZXcgcGFyYW1ldGVycyBhbmQgZnVuY3Rpb25zIGZv
ciBhbWRncHVfdW1jDQogICAgc3RydWN0dXJlDQogIGRybS9hbWRncHU6IGFkZCBtYWNybyBvZiB1
bWMgZm9yIGVhY2ggY2hhbm5lbA0KICBkcm0vYW1kZ3B1OiBhcHBseSB1bWNfZm9yX2VhY2hfY2hh
bm5lbCBtYWNybyB0byB1bWNfNl8xDQogIGRybS9hbWRncHU6IGFkZCBlcnJvciBhZGRyZXNzIHF1
ZXJ5IGZvciB1bWMgcmFzDQoNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMgfCAgNSArKyAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oIHwgMzYg
KysrKysrKysrKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8IDEy
ICsrKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jICAgfCA5MiArKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2
XzEuaCAgIHwgIDUgKysNCiA1IGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDU5IGRl
bGV0aW9ucygtKQ0KDQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
