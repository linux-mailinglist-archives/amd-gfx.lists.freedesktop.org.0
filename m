Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95081B356C
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 09:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2BA6E140;
	Mon, 16 Sep 2019 07:17:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710067.outbound.protection.outlook.com [40.107.71.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908AE6E140
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 07:17:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVjp5b3n3s7uK4OKQX90NsS8MYI81jtqJhygBhnbuHSOxIcJRDabPfdgwrKxb2SmYKY+HlmvAaICNf4JnUiMMgxH7oPvhs0/UKbCZfcFQERwOILeRolLVLmS9xfCweabIeW+959QkXxr3Uj+t7/J3nUInpWprG60JGwz30WqlO9EcZGp7p0nDfFHIMzmzRxKAY0MqRoXcCraS8gGLcdbugra3TAXYsyo3HYg4qlZN39EQUA0EYv3TMphs5d8jzKlea6cTRDrefzXnjay1QHC7qAqQyqAGNFUIsbMR7ojMXa0MmE0rv283hSJvyvCnw6A0ah+srAcry5ex/mEO/GuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1BWA3W+BMggklo5PzYiZCn3VjpDyj80zjA9l1M1q+Q=;
 b=SSYocXi8NMDZF4+O/ULUB7JKJPJ6in/8fINX933tP6t0tsTnL3Rc0IgynPhQ8HdINjjBh+IIIPEKs71hXqf5OL9BViNU4x1vL2C7eB/uu8E8/O9jFDduQF/SM+GtM0D4br4yNPG3Nq6c6BLZDTiuXPg1hFaAX44ol4XM/Hm5VZY24QEwNqKt0/V5Flvf/1hrtcOP8E4ZGwlOh04jkWsynedJmFiZvOBKlyuuDAC0FjMiQ6yXE5rP8OA+CrHeKaNTrjGbfjkeKBzsVApLwPTr90/ZwvUW3KtWFZju0huP3DfyykC//Uv70Lo4PT8UelWys0GCG3iUUIyBxr4PkH117A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 07:17:49 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 07:17:49 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Zhao, Jiange" <Jiange.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/SRIOV: Navi12 SRIOV VF gets GTT base
Thread-Topic: [PATCH] drm/amdgpu/SRIOV: Navi12 SRIOV VF gets GTT base
Thread-Index: AQHVbFyU2TuJmjuV9kGcvDWvxshJhKct5L6g
Date: Mon, 16 Sep 2019 07:17:48 +0000
Message-ID: <MN2PR12MB297529D0F781DD36715FEA4F8F8C0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <20190916070114.9250-1-jianzh@amd.com>
In-Reply-To: <20190916070114.9250-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d930e7b-d451-4bd7-05bd-08d73a75fae2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4093; 
x-ms-traffictypediagnostic: MN2PR12MB4093:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40932592012C1675514898C78F8C0@MN2PR12MB4093.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(13464003)(189003)(199004)(33656002)(316002)(74316002)(229853002)(76176011)(6506007)(6116002)(3846002)(99286004)(7696005)(14454004)(25786009)(8676002)(81156014)(2906002)(81166006)(2501003)(71190400001)(71200400001)(8936002)(52536014)(66946007)(66446008)(66476007)(66556008)(64756008)(76116006)(66066001)(5660300002)(186003)(7736002)(305945005)(6436002)(53936002)(102836004)(478600001)(446003)(9686003)(4326008)(26005)(54906003)(110136005)(256004)(476003)(486006)(55016002)(6246003)(86362001)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4093;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y9CWD5e44oRc/Eepw7yzdS4RlqEp4FdQyYxLCbKx88u8KaQ0q+kzrmljy7ql7CvSntm4L1l6AEc9P7qsW1kUYZbcIneux76uvKboAo4ZRZTCmCVHq50ti74TeF2PTnt2RZ3vAXa6S8kRBLNM6opuGayI75i8G7zXjmi6Es8ZFZlscEcLDH1pbgOztN7xR94Ld8m8vT12HUftzEvbNGrz4E9ycushaExjKi7FLeoIdLJxO6MfAvYpsYtn62JjdtawW1qJ4+uI8MNnrvqELdoaLDyiRJafJimLzQT37cXkAzsW4bCwqtwxB4Dw/bu2RsgJSwmriAz5oVWBOaKd/VXOIkdsTB3eFW5F0FPs2sulp/b31tcrGeSDBfAemLBMRGro/WLsHdt2j900jKcQRCz8/qZkq9qAcPm1oc/sgsEaYVo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d930e7b-d451-4bd7-05bd-08d73a75fae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 07:17:48.9846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLm6JieuIAAu+Xy8+Ipl7P7WtBvXvM/14EsHopBv0DvJoo2lKi+9FYDJ9EmzxyP7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1BWA3W+BMggklo5PzYiZCn3VjpDyj80zjA9l1M1q+Q=;
 b=3ICPJ/LKS9GomaFxLcQdqKstakSa8g6rrQ0xqO38MNS1UTi0pqh84TlNVNJPxImGWPgyme7VFna4Hch/lYSRjyfVJJIpZDdmdF+PXD5no96YENwtSr0o8WPOucfDc5jO/XDho6Pem3n8FDeQmtVOreU+PNCgbaR0iPK/0vKKI4I=
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
Pgo+U2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMTkgMzowMiBQTQo+VG86IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj5DYzogTmlldG8sIERhdmlkIE0gPERhdmlkLk5pZXRvQGFt
ZC5jb20+OyBEZW5nLCBFbWlseQo+PEVtaWx5LkRlbmdAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0
aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Owo+WmhhbywgSmlhbmdlIDxKaWFuZ2UuWmhh
b0BhbWQuY29tPgo+U3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L1NSSU9WOiBOYXZpMTIgU1JJ
T1YgVkYgZ2V0cyBHVFQgYmFzZQo+Cj5Gcm9tOiBKaWFuZ2UgWmhhbyA8SmlhbmdlLlpoYW9AYW1k
LmNvbT4KPgo+V2l0aCBjaGFuZ2VzIGluIFBTUCBhbmQgSFYsIFNSSU9WIFZGIHdpbGwgaGFuZGxl
Cj4KPnZyYW0gZ3R0IGxvY2F0aW9uIGp1c3QgbGlrZSBiYXJlIG1ldGFsLiBUaGVyZSBpcwo+Cj5u
byBuZWVkIHRvIGRpZmZlcmVudGlhdGUgaXQgYW55bW9yZS4KPgo+U2lnbmVkLW9mZi1ieTogSmlh
bmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5jb20+Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjEwXzAuYyB8IDMgKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3YxMF8wLmMKPmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8w
LmMKPmluZGV4IDFhOGQ4ZjUyOGIwMS4uZWQxYzNiODgzZjZhIDEwMDY0NAo+LS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192MTBfMC5jCj5AQCAtNTE5LDggKzUxOSw3IEBAIHN0YXRpYyB2b2lkIGdt
Y192MTBfMF92cmFtX2d0dF9sb2NhdGlvbihzdHJ1Y3QKPmFtZGdwdV9kZXZpY2UgKmFkZXYsICB7
Cj4gCXU2NCBiYXNlID0gMDsKPgo+LQlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkKPi0JCWJh
c2UgPSBnZnhodWJfdjJfMF9nZXRfZmJfbG9jYXRpb24oYWRldik7Cj4rCWJhc2UgPSBnZnhodWJf
djJfMF9nZXRfZmJfbG9jYXRpb24oYWRldik7Cj4KPiAJYW1kZ3B1X2dtY192cmFtX2xvY2F0aW9u
KGFkZXYsICZhZGV2LT5nbWMsIGJhc2UpOwo+IAlhbWRncHVfZ21jX2dhcnRfbG9jYXRpb24oYWRl
diwgbWMpOwo+LS0KPjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
