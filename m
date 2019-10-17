Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D0DB6C3
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0A06E487;
	Thu, 17 Oct 2019 19:04:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC376E06E
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvP2VmKRR/mHIepJFGPJ4XPTsKDPDqATXYJXIQ3JI3xY9O3ci02s3ZV472Sfk25wkWHwlv8VhFwdf/tevSxSW5ZAxqOkLBgfck/huD+dgMZ76qeytqRXRuWlJPkjwXnR6tQ1LxyCBzkDkpdkUi6QK9CFPnIlr/JA3rcHeDF5JVbhTi6zFZnKB1nJVd1t/95Inq1LhgCl4ULeNeOCJuD/VbGLgZSV0VoFYsGadi5AUdNd7Dtmi+pZP2esEi7lY10bAZDs0nGho7L0H0dMp+FWFXUtGJwmY/5Asf8005RrYJvZzaHIGQ1Bgd5gRMMHvXCYq9q/28prWpKY4UdxzRlyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oyHw8/NkOowUygPURIUzB6wcnjmAtGBinhaF06s+Ck=;
 b=lmZhn8Vx/OC+BihLQYqRun2q/obX6hpByLRspQ2Tg2gRirjmhS+flDLkq5I9P/akxn/tmoKoDB/fFRRb4ShKdm80btHScqh9jLeavw1OJ57uqIURgot3JIifCseUiiEv5empPSGTEBqIz6a35qGrkITQlpnWUNb3F8DiW0qj16ESURw3DeCreAsZFjNdFEnHmuRQXqV0s38m+7k3Gc7gR7lRyezfVVofdx7Mn1KdqTIKVJI65Gs6gjDNV0HcAhD7Mo81pzn7n5OuIcL0rbHvdoo6JIP78QxNdiIn5HpGuC7Fb0S3pL4XGPwtTW8b9WbsbeLdSopAuN8xYVJPW+LGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB3660.namprd12.prod.outlook.com (10.255.76.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 17 Oct 2019 19:04:18 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 19:04:18 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Zhan" <Zhan.Liu@amd.com>
Subject: [PATCH v2] drm/amd/display: Modify display link stream setup sequence.
Thread-Topic: [PATCH v2] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Index: AQHVhR1bdUiBxSuwH0WEjqoIXDrvFQ==
Date: Thu, 17 Oct 2019 19:04:18 +0000
Message-ID: <DM6PR12MB3466E0D0DADF7599F877F0859E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1085a75f-2c22-4eee-0c84-08d75334cfdf
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3660:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB366080B37970F832AD78DC379E6D0@DM6PR12MB3660.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(189003)(199004)(3846002)(66946007)(66476007)(966005)(66446008)(64756008)(8676002)(316002)(14454004)(476003)(99286004)(8936002)(110136005)(6506007)(86362001)(81156014)(81166006)(486006)(76116006)(91956017)(66066001)(33656002)(256004)(102836004)(66556008)(55016002)(2906002)(6306002)(9686003)(25786009)(478600001)(71200400001)(71190400001)(7696005)(6436002)(52536014)(305945005)(7736002)(26005)(6116002)(74316002)(5660300002)(186003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3660;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i+qrZWSsMtkxWEJ5zVPQvsFdwUCCsu1mM6FI6Sa/Kq78hFNOdSX7UwTjASGo+Nz+D12z/L3rFoqTdYlF0eRUzstSKhG+EJ9LcCEHaFYKDBSHhzwA28Ur9T5IESYQCfKfABqC1dyd7LdSVcGzRGPEugpDy/LVIIwBYk3SIw0Is0TpAtAaRnaq9U/I0ETCPE5+hJUHcIUo766q+nwMa8MOaGwZQsAP9jvhtNNbboieJTPLmYIK64yT12KohuRKCMAnJuANqYR52cwuf/I7OfYEyXGYjJ/GZYpr5catqhj5cLTR4yKtHBNyDN+5+nw5hYxGRdH8P8gikGNF79gN3lBVR/S+egvgby91r0pJJEME3hboalx1kOCnk/l2FzOr9U91gbgemghJHyoG3xTlQHJBS7/IWp0GgE6z3/O9h2+9YyuyMx7ugg6SavxUqffQl8eHsDDZ0ZXRXle/1nLVk9C7dw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1085a75f-2c22-4eee-0c84-08d75334cfdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 19:04:18.5901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pll/FnFFj8qNLEanftd91Int6VYJ8cyOKMDdFqPVVmjQ6eGI7wSXQzsLI4fgFbRz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3660
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oyHw8/NkOowUygPURIUzB6wcnjmAtGBinhaF06s+Ck=;
 b=Dzw873d+Md5cYVDtTzk62hOQMTarkSWPk2SRIdajCV75tZeMUpkRpZWr82tTL1w/JFM1Z4I9/hi06N0vKO+Hgdlkbdt2KMkRgwrUucpwV7ueozVdRpKYeApSGOONHmEc+jsAii6ZrG5FrOFVAf6atm/+Ji1mlWHh53G97Hr7aHY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
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

W1doeV0KVGhpcyBwYXRjaCBpcyBmb3IgZml4aW5nIE5hdmkxNCBwaW5rIHNjcmVlbiBpc3N1ZS4g
V2l0aCB0aGlzCnBhdGNoLCBzdHJlYW0tPmxpbmstPmxpbmtfZW5jLT5mdW5jcy0+c2V0dXAgd2ls
bCBiZSBjYWxsZWQKdHdpY2U6IHRoaXMgd2lsbCBtYWtlIHN1cmUgR0NfU0VORCBpcyBzZXQgdG8g
MS4gVGhvdWdoIHdlCnN0aWxsIG5lZWQgdG8gbG9vayBpbnRvIHdoeSB0aGUgaXNzdWUgb25seSBo
YXBwZW5zIG9uCkxpbnV4LCBidXQgbm90IG9uIFdpbmRvd3Mgc2lkZS4KCltIb3ddCkNhbGwgc3Ry
ZWFtLT5saW5rLT5saW5rX2VuYy0+ZnVuY3MtPnNldHVwIHR3aWNlLgoKU2lnbmVkLW9mZi1ieTog
WmhhbiBsaXUgPHpoYW4ubGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGluay5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
LmMKaW5kZXggOTM1MDUzNjY0MTYwLi44NjgzZTg2MTNlYzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKQEAgLTI4NDIsNiArMjg0MiwxMiBAQCB2
b2lkIGNvcmVfbGlua19lbmFibGVfc3RyZWFtKAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQ09OVFJPTExFUl9EUF9URVNUX1BBVFRFUk5fVklERU9NT0RFLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ09MT1JfREVQVEhfVU5ERUZJTkVEKTsK
CisgICAgICAgICAgICAgICAvKiBIYWNrIG9uIE5hdmkxNDogZml4ZXMgTmF2aTE0IEhETUkgcGlu
ayBzY3JlZW4gaXNzdWUgKi8KKyAgICAgICAgICAgICAgIGlmICghZGNfaXNfdmlydHVhbF9zaWdu
YWwocGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFsKSkKKyAgICAgICAgICAgICAgICAgICAgICAgc3Ry
ZWFtLT5saW5rLT5saW5rX2VuYy0+ZnVuY3MtPnNldHVwKAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cmVhbS0+bGluay0+bGlua19lbmMsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFsKTsKKwogI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0RTQ19TVVBQT1JUCiAgICAgICAgICAgICAgICBpZiAocGlwZV9jdHgtPnN0cmVhbS0+
dGltaW5nLmZsYWdzLkRTQykgewogICAgICAgICAgICAgICAgICAgICAgICBpZiAoZGNfaXNfZHBf
c2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkgfHwKLS0KMi4xNy4wCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
