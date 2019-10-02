Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC420C8A62
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 16:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5349889017;
	Wed,  2 Oct 2019 14:00:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1A289017
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 14:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNdY2zQ0wMCW0uR3PDWeGj44MN47DEhXswdf9411Zt6te6HwjlkQ33Nt8OOtmxA6khQNbSNl5zCmZ60Dq3irkwTFjOthVDBzc0kQ7QOoPXAma30TjTf8gIbJzgayLoYZZHWK96AChIeKs6kiMwpeYuyDOwLSb1d1alz/6dbvhDoX+huh7UklUO8sClR9iLrALkQLK6EQYr7ADLCFGeTu2IiOmXBbQ2KDNknBK2M682Op5BeAv/E3e8fbd3bhVKkGCgZH3qF6ivUopBXWVnr1jD4GEmRu9++RN/d1KMWOmvoOLxeksfH6x41meLn8c5LfCA4nOU8iybRiCeoifwH5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJbRP/fkJj0HzwtTjVnF1zvxTKKDUpNGf8HA5siGVz8=;
 b=Qr0A3gMnfcjKsooO4CV25HDktoIMei/hqQgXSUjDG0rt2k2mioYan7AEb73rS/07A4ZmajEoYl+xc2YLNTcwJtMMKtlvUux3LksPky61m+QB6hniBUQE+y3pi/4ENildUqx43KCUpyHVGIab3sN6JU1KGmwFHoG4Eocf20O4W9o3JEfRBlJ09pGT1aPXF7juTc828LQi9S84+k2yLGrOuyDh3Pxcd1i3AjHFl7Vu7V9uE7uP/A9pXac5ZJ493fuWtHSm2rU2fUo5KehVCAQx4Ku5UXB/aVjz/EGat1cfF3/LuzTjWwJoScXxT2p6Nt0sScD5PzFSkGzTz6MfSGDmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3571.namprd12.prod.outlook.com (20.178.208.159) by
 BN8PR12MB3491.namprd12.prod.outlook.com (20.178.210.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 14:00:02 +0000
Received: from BN8PR12MB3571.namprd12.prod.outlook.com
 ([fe80::a45f:f6ae:3e29:7f7c]) by BN8PR12MB3571.namprd12.prod.outlook.com
 ([fe80::a45f:f6ae:3e29:7f7c%7]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 14:00:02 +0000
From: "Koo, Anthony" <Anthony.Koo@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [bug report] drm/amd/display: Fix exception from AUX acquire
 failure
Thread-Topic: [bug report] drm/amd/display: Fix exception from AUX acquire
 failure
Thread-Index: AQHVeRi1MDmLpFC6vkqcq07Cm6uN4qdHYNMQ
Date: Wed, 2 Oct 2019 14:00:02 +0000
Message-ID: <BN8PR12MB3571692222331859AF418084F39C0@BN8PR12MB3571.namprd12.prod.outlook.com>
References: <20191002115814.GA10545@mwanda>
In-Reply-To: <20191002115814.GA10545@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c84e54d0-fc1b-49bb-3db3-08d74740d23a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3491:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB34918272824BDBE675265D26F39C0@BN8PR12MB3491.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(13464003)(199004)(189003)(51914003)(26005)(2906002)(9686003)(86362001)(3846002)(6116002)(55016002)(478600001)(305945005)(6246003)(71190400001)(8676002)(81166006)(6916009)(25786009)(81156014)(4326008)(99286004)(11346002)(8936002)(66066001)(54906003)(476003)(33656002)(74316002)(316002)(14454004)(71200400001)(6436002)(486006)(5660300002)(7696005)(256004)(14444005)(76176011)(229853002)(446003)(66556008)(6506007)(66446008)(64756008)(66946007)(7736002)(66476007)(53546011)(102836004)(52536014)(76116006)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3491;
 H:BN8PR12MB3571.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rxqL1GED8/7cfEhrT3mDYCBre6qqqwGFrkq7IMXjRnKsDqyhijfV9q6cRgKY+s2M4NOgBG2ShIKD6z6zSyxptsVFa15X7Q4gYtUGp0B6iGQIfu75GnBRJgACm+Sdgz1TrWBzVUTE0DJP28mOnaUcS42QcYRQ4b83M+WQayEwMWi1JLLIH+MipmmqVY98nDeVKl/X4P2CWWlRsUatEFqAYgt9+a5C8PmPApF0UFosFJpJB+XQpmT9v1Zqe8zvR+qZTNBSFJA2ZDRFlD31yPk84gjYE+EzvtHIoyS9m+zYeaGNsTQa4vtNWLRPogRsUYgxJ/OLm9DdkW7k+h4mVIDyjdHyJjwrc2WfKaVbvMpfIUsXldTQESe/WMDZ6ZRcdz2gXftY5z9HY3dfu0cRfa/R4ObM5Uj8aFerg09w8JErafs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84e54d0-fc1b-49bb-3db3-08d74740d23a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 14:00:02.5536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9WpJQ6mi73VRD3Oiq8n4H2un312bF/OHjDT43deO8fXAaWnEfmDe2PRMjmgvIWw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJbRP/fkJj0HzwtTjVnF1zvxTKKDUpNGf8HA5siGVz8=;
 b=0AfzI9s7QrbMgcH0Eu91ZEF50/zf0nDhojwYKhSI8qkrbD0DevyoqGwbrXXDfD5+/bOMsm1kTQ2OiDTt3XxzRcvgda98G1DW93MhKvG1Qdoep7RdNd0SVotEWDRp3itobU8xOd6tIcRDgG/xW8BvHKKzALKBCX8d/n68yTy1hMk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Anthony.Koo@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRGFuLAoKVGhhbmtzIGZvciB0aGUgaGVhZHMhCgpJIHdpbGwgd29yayBvbiBhIHBhdGNoIHRv
IGFkZHJlc3MgdGhpcyBpc3N1ZS4KClJlZ2FyZHMsCkFudGhvbnkKCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCkZyb206IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4g
ClNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyLCAyMDE5IDc6NTggQU0KVG86IEtvbywgQW50aG9u
eSA8QW50aG9ueS5Lb29AYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClN1YmplY3Q6IFtidWcgcmVwb3J0XSBkcm0vYW1kL2Rpc3BsYXk6IEZpeCBleGNlcHRpb24gZnJv
bSBBVVggYWNxdWlyZSBmYWlsdXJlCgpIZWxsbyBBbnRob255IEtvbywKClRoZSBwYXRjaCBkY2Yx
YTk4ODY3OGU6ICJkcm0vYW1kL2Rpc3BsYXk6IEZpeCBleGNlcHRpb24gZnJvbSBBVVggYWNxdWly
ZSBmYWlsdXJlIiBmcm9tIEZlYiA2LCAyMDE5LCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIHN0YXRp
YyBjaGVja2VyIHdhcm5pbmc6CgoJZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jOjEwOCBkbV9kcF9hdXhfdHJhbnNmZXIo
KQoJZXJyb3I6IHVuaW5pdGlhbGl6ZWQgc3ltYm9sICdvcGVyYXRpb25fcmVzdWx0Jy4KCmRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3Rf
dHlwZXMuYwogICAgODIgIHN0YXRpYyBzc2l6ZV90IGRtX2RwX2F1eF90cmFuc2ZlcihzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqYXV4LAogICAgODMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZHJtX2RwX2F1eF9tc2cgKm1zZykKICAgIDg0ICB7CiAgICA4NSAgICAgICAgICBz
c2l6ZV90IHJlc3VsdCA9IDA7CiAgICA4NiAgICAgICAgICBzdHJ1Y3QgYXV4X3BheWxvYWQgcGF5
bG9hZDsKICAgIDg3ICAgICAgICAgIGVudW0gYXV4X2NoYW5uZWxfb3BlcmF0aW9uX3Jlc3VsdCBv
cGVyYXRpb25fcmVzdWx0OwogICAgODggIAogICAgODkgICAgICAgICAgaWYgKFdBUk5fT04obXNn
LT5zaXplID4gMTYpKQogICAgOTAgICAgICAgICAgICAgICAgICByZXR1cm4gLUUyQklHOwogICAg
OTEgIAogICAgOTIgICAgICAgICAgcGF5bG9hZC5hZGRyZXNzID0gbXNnLT5hZGRyZXNzOwogICAg
OTMgICAgICAgICAgcGF5bG9hZC5kYXRhID0gbXNnLT5idWZmZXI7CiAgICA5NCAgICAgICAgICBw
YXlsb2FkLmxlbmd0aCA9IG1zZy0+c2l6ZTsKICAgIDk1ICAgICAgICAgIHBheWxvYWQucmVwbHkg
PSAmbXNnLT5yZXBseTsKICAgIDk2ICAgICAgICAgIHBheWxvYWQuaTJjX292ZXJfYXV4ID0gKG1z
Zy0+cmVxdWVzdCAmIERQX0FVWF9OQVRJVkVfV1JJVEUpID09IDA7CiAgICA5NyAgICAgICAgICBw
YXlsb2FkLndyaXRlID0gKG1zZy0+cmVxdWVzdCAmIERQX0FVWF9JMkNfUkVBRCkgPT0gMDsKICAg
IDk4ICAgICAgICAgIHBheWxvYWQubW90ID0gKG1zZy0+cmVxdWVzdCAmIERQX0FVWF9JMkNfTU9U
KSAhPSAwOwogICAgOTkgICAgICAgICAgcGF5bG9hZC5kZWZlcl9kZWxheSA9IDA7CiAgIDEwMCAg
CiAgIDEwMSAgICAgICAgICByZXN1bHQgPSBkY19saW5rX2F1eF90cmFuc2Zlcl9yYXcoVE9fRE1f
QVVYKGF1eCktPmRkY19zZXJ2aWNlLCAmcGF5bG9hZCwKICAgMTAyICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZvcGVyYXRpb25fcmVzdWx0KTsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eIFRoZSBwYXRj
aCBhZGRzIGEgbmV3IHJldHVybiB3aGVyZSAib3BlcmF0aW9uX3Jlc3VsdCIgaXNuJ3QgaW5pdGlh
bGl6ZWQuCgogICAxMDMgIAogICAxMDQgICAgICAgICAgaWYgKHBheWxvYWQud3JpdGUpCiAgIDEw
NSAgICAgICAgICAgICAgICAgIHJlc3VsdCA9IG1zZy0+c2l6ZTsKICAgMTA2ICAKICAgMTA3ICAg
ICAgICAgIGlmIChyZXN1bHQgPCAwKQogICAxMDggICAgICAgICAgICAgICAgICBzd2l0Y2ggKG9w
ZXJhdGlvbl9yZXN1bHQpIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5e
Xl5eXl5eXl5eCgogICAxMDkgICAgICAgICAgICAgICAgICBjYXNlIEFVWF9DSEFOTkVMX09QRVJB
VElPTl9TVUNDRUVERUQ6CiAgIDExMCAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAg
IDExMSAgICAgICAgICAgICAgICAgIGNhc2UgQVVYX0NIQU5ORUxfT1BFUkFUSU9OX0ZBSUxFRF9I
UERfRElTQ09OOgogICAxMTIgICAgICAgICAgICAgICAgICBjYXNlIEFVWF9DSEFOTkVMX09QRVJB
VElPTl9GQUlMRURfUkVBU09OX1VOS05PV046CiAgIDExMyAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVzdWx0ID0gLUVJTzsKICAgMTE0ICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsK
ICAgMTE1ICAgICAgICAgICAgICAgICAgY2FzZSBBVVhfQ0hBTk5FTF9PUEVSQVRJT05fRkFJTEVE
X0lOVkFMSURfUkVQTFk6CiAgIDExNiAgICAgICAgICAgICAgICAgICAgICAgICAgcmVzdWx0ID0g
LUVCVVNZOwogICAxMTcgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAxMTggICAg
ICAgICAgICAgICAgICBjYXNlIEFVWF9DSEFOTkVMX09QRVJBVElPTl9GQUlMRURfVElNRU9VVDoK
ICAgMTE5ICAgICAgICAgICAgICAgICAgICAgICAgICByZXN1bHQgPSAtRVRJTUVET1VUOwogICAx
MjAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAxMjEgICAgICAgICAgICAgICAg
ICB9CiAgIDEyMiAgCiAgIDEyMyAgICAgICAgICByZXR1cm4gcmVzdWx0OwogICAxMjQgIH0KCnJl
Z2FyZHMsCmRhbiBjYXJwZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
