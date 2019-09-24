Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78193BC271
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 09:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038096E9F4;
	Tue, 24 Sep 2019 07:19:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690055.outbound.protection.outlook.com [40.107.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65786E9F4
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 07:19:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPTbsWurmv3DM7WOHG1Y1c0ePUbatmTaUiJExHc31erD664Znvjt2ZGumQ+pZsf94ifV4p8/H8wpl45H4Qw9BHgiT1BGBSIx7v8KAqE0eYg71eoX0ojeqY5EVonHFG4Ge8lS8KRXewU3LUwJGS5ISUAN70EEjFU/1FbRLtg6cmhguDdDF+L8F/a1+5xCYf5W7L6JSO7u7ge4liU63B+LrkpZOuCVoN8OQhh8DpVXL0ayIkSl6FsArm3hlkKIP9XJFIGVtEDlCIAH/Kp5gitkr0ZC8vcpjHHrDmKJelPhajAH1gS6ZHHpOsubCXfiM8quFWYiOlPo6Bd3xTSG4manQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsdWfB+KlvBJOvjNOxAJnVV/IJoy4lpVgrBr05xhE44=;
 b=fFQvA/TZcD/KVbIBDBYgQT5Y/Hppa3RxtHDwrNgfDiKkJmgarrPptB0RRVVfaZFnwWuOaJV+goweOmXMVtHzlocffIj18YvA2CxVB+C8PNDnbv80miFN/g0jnluU3XtpBKSrQRyiZv2DZw3ngDrkYgykqhG0O+tzqOzrOOsjOvS2bZyqdpBqytD4fq2FIixvozypSOQJZCWEOME6Nv4PJdRLA7t14WEFgEkqhVA4eGkFyYKG71clc5Yv8GJ3m5So0V4tE8sWa7fkiOHYCGzFsH0ikFUbv4lOKkOHv1Prhaqfy37me9jdPfNQ2Q9psMXO29+tHBE3wtzd3zKkyNF24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3473.namprd12.prod.outlook.com (20.178.209.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 07:19:30 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:19:30 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi12
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi12
Thread-Index: AQHVcoRJ/hPL7jNvCkCPVhA00il2HKc6J2VQgABCiv8=
Date: Tue, 24 Sep 2019 07:19:30 +0000
Message-ID: <BN8PR12MB3602DD5B7EC8F117B559C50489840@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190924030042.5545-1-xiaojie.yuan@amd.com>,
 <BN8PR12MB3329DDCAF8D6276EFDB2AA9AE4840@BN8PR12MB3329.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3329DDCAF8D6276EFDB2AA9AE4840@BN8PR12MB3329.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13093529-7069-4ee5-6ca1-08d740bf8aa2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3473; 
x-ms-traffictypediagnostic: BN8PR12MB3473:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB34739422A9BA67CB7274948A89840@BN8PR12MB3473.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(189003)(199004)(13464003)(91956017)(54906003)(76116006)(9686003)(6436002)(2501003)(4326008)(55016002)(478600001)(74316002)(316002)(8936002)(33656002)(25786009)(14454004)(5660300002)(229853002)(3846002)(6116002)(99286004)(6506007)(81156014)(446003)(7736002)(53546011)(186003)(86362001)(14444005)(256004)(11346002)(71190400001)(66556008)(71200400001)(64756008)(76176011)(102836004)(305945005)(66066001)(8676002)(26005)(52536014)(486006)(110136005)(476003)(6246003)(2906002)(66946007)(66446008)(7696005)(66476007)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3473;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tMsZ9ji9TzHhe81hZ8LGAx6dMNnlgbG3ryAJxPM3hlFviRK/Ehfe+CEy/4QOphHP83MhmQQ2Isq+Di1HfRiMZjeRh3sXa6a4VIa8IYQzboWYOPokTO9F4fhLS74JeqGGD51OHQTYdih8CIiYmCWxrJSCe/dnCRFkeBoEZQFU9CHvkwBiqgkqRBvuo9HevQL34q6P7F0otXDef5zwRyb0s6d2tolR9Co7xYxOkuC0077gDuLZSvtlTcbq+oZFAWW7mMz5cgykrFlUT/NDNduWflbSsDeeESIiGLIRjftCBQcVtjDmdn9xUPM5WvmzG/znEvxZon8m7OdcE3N4sPOkCF7iu144RZ3JYZzD3zEm6wNgYcS74tghbNIHL2h4a+m+YT15M2ZII0rpmI2BJbt9H1p8KgLO1wZJy4k+SfokQbY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13093529-7069-4ee5-6ca1-08d740bf8aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:19:30.3277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TlX+2HjVyWjrbgC33Buv4aCXWxYQpV1V/HuRZwKWppYR8VErpO7DREHzELsOUB5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3473
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsdWfB+KlvBJOvjNOxAJnVV/IJoy4lpVgrBr05xhE44=;
 b=yNzrf4uuw+Wicx/bTwjqCZ7i9PNmcZsWVO0S623OIbMZV6kRIig/L2kMhnMiNgd+ajjMbLPaW2YOPXeQgzCzlGAi3x0FHKXy5yZG+RLw/kZUCp88GVLKcoBsDKDp8VasSz6FbEqfDvU39xZPh7nx5oritizOqIVSgv8oYle05KE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEV2YW4uIFNpbmNlIHdlIGN1cnJlbnRseSBoYXMgb25seSBvbmNlIHBsYWNlIHRvIGNo
ZWNrICdpcyBuYXZpIHNlcmllcycsIEknZCBwcmVmZXIgbm90IHRvIHB1dCBpbnRvIGEgbWFjcm8g
dW50aWwgd2UgaGF2ZSBhbm90aGVyIHBsYWNlIHRvIGNoZWNrIHRoYXQuIERvZXMgdGhlIGNoYW5n
ZSBiZWxvdyBsb29rcyBnb29kIHRvIHlvdT8KCi0gICAgICAgICAgIGFkZXYtPmFzaWNfdHlwZSA+
IENISVBfTkFWSTE0IHx8CisgICAgICAgICAgICEoYWRldi0+YXNpY190eXBlID49IENISVBfTkFW
STEwICYmIGFkZXYtPmFzaWNfdHlwZSA8PSBDSElQX05BVkkxMikgfHwKCkJSLApYaWFvamllCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IFF1YW4sIEV2YW4g
PEV2YW4uUXVhbkBhbWQuY29tPgpTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjQsIDIwMTkgMTE6
MTggQU0KVG86IFl1YW4sIFhpYW9qaWU7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBaaGFuZywgSGF3a2luZzsgWGlhbywgSmFjazsgWWluLCBUaWFuY2kgKFJpY28pClN1YmplY3Q6
IFJFOiBbUEFUQ0hdIGRybS9hbWRncHUvZ21jMTA6IGFwcGx5IHRoZSAnaW52YWxpZGF0aW9uIGZy
b20gc2RtYScgd29ya2Fyb3VuZCBmb3IgbmF2aTEyCgpBIHNtYWxsIG5pdHBpY2s6IGlmIHRoaXMg
d29ya2Fyb3VuZCBpcyBuZWVkZWQgZm9yIGFsbCBOQVZpIEFTSUNzLCBjYW4gd2UgbWFrZSBhIG1h
Y3JvIGZvciB0aGlzPwplLmcuICAjZGVmaW5lIEFTSUNfSVNfTkFWSV9TRVJJRVMoYWRldikgICAg
ICAgICAgICAgICAoYWRldi0+YXNpY190eXBlID49IENISVBfTkFWSTEwICYmIGFkZXYtPmFzaWNf
dHlwZSA8PSBOQVZJMTIpCgpUaGVuIHdlIGNhbiB1c2UKICAgICAgICBpZiAoIWFkZXYtPm1tYW4u
YnVmZmVyX2Z1bmNzX2VuYWJsZWQgfHwKICAgICAgICAgICAgIWFkZXYtPmliX3Bvb2xfcmVhZHkg
fHwKLSAgICAgICAgICAgYWRldi0+YXNpY190eXBlID4gQ0hJUF9OQVZJMTQgfHwKKyAgICAgICAg
ICAgIUFTSUNfSVNfTkFWSV9TRVJJRVMoYWRldikgfHwKICAgICAgICAgICAgYWRldi0+aW5fZ3B1
X3Jlc2V0KSB7CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBZdWFuLCBYaWFvamll
IDxYaWFvamllLll1YW5AYW1kLmNvbT4KU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDI0LCAyMDE5
IDExOjAxIEFNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFhpYW8sIEphY2sgPEphY2suWGlhb0BhbWQu
Y29tPjsgWWluLCBUaWFuY2kgKFJpY28pIDxUaWFuY2kuWWluQGFtZC5jb20+OyBRdWFuLCBFdmFu
IDxFdmFuLlF1YW5AYW1kLmNvbT47IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQuY29t
PgpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvZ21jMTA6IGFwcGx5IHRoZSAnaW52YWxpZGF0
aW9uIGZyb20gc2RtYScgd29ya2Fyb3VuZCBmb3IgbmF2aTEyCgp3aGVuIGdmeG9mZiBpcyBlbmFi
bGVkLCBzZG1hIGhhbmdzIHdoaWxlIGVudGVyaW5nIGRlc2t0b3Agd2l0aG91dCB0aGlzIHdvcmth
cm91bmQKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192MTBfMC5jCmluZGV4IGVkMWMzYjg4M2Y2YS4uMDMwNGNhOGZlNzIzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwpAQCAtMjkxLDcgKzI5MSw3IEBA
IHN0YXRpYyB2b2lkIGdtY192MTBfMF9mbHVzaF9ncHVfdGxiKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1aW50MzJfdCB2bWlkLAoKICAgICAgICBpZiAoIWFkZXYtPm1tYW4uYnVmZmVyX2Z1
bmNzX2VuYWJsZWQgfHwKICAgICAgICAgICAgIWFkZXYtPmliX3Bvb2xfcmVhZHkgfHwKLSAgICAg
ICAgICAgYWRldi0+YXNpY190eXBlID4gQ0hJUF9OQVZJMTQgfHwKKyAgICAgICAgICAgYWRldi0+
YXNpY190eXBlID4gQ0hJUF9OQVZJMTIgfHwKICAgICAgICAgICAgYWRldi0+aW5fZ3B1X3Jlc2V0
KSB7CiAgICAgICAgICAgICAgICBnbWNfdjEwXzBfZmx1c2hfdm1faHViKGFkZXYsIHZtaWQsIEFN
REdQVV9HRlhIVUJfMCwgMCk7CiAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmFkZXYtPm1t
YW4uZ3R0X3dpbmRvd19sb2NrKTsKLS0KMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
