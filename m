Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B74B7B5D
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 15:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C176F694;
	Thu, 19 Sep 2019 13:59:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720083.outbound.protection.outlook.com [40.107.72.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98296F694
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 13:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gD19I7TwowDR6lPOsRatgqNKHgrMkEkQPkP3Izcoc1bcSFYAw7E/N1GD71e1W+Sspk9k40ilPoBgr2WKiUQ/8v6TvSyZ0v3dLGtIJ1wCsMpO/j7R7t6vdSixwz+44Uw4T1YZcWut10wjX31PTmFlBIx5Sre7RIt0k2jaZzAB0SJYwNpa6AvbRxyETlqvG1sK4gfM7D5IuWApLHEYOCYJ40MioR/+lN3Ai6x0vpS6ive3NcxIY4zpZ+89ohdxR+Q96rMt2OFkm3ZuWdPe5yUzGQZhRzzudyzt5lJqFABhPsxgpl7T4tLu/DNA09b8+WlRDNUS5Sj6rKzdqK/zAWmomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFWSQd9aWCMa7u8KiORJn3RPkMzx6Bqs8xuWoUUr7PE=;
 b=kPBa+jTSncTMQc2jL4aZi4aGaX7oIRMhslrz9DWIFitr8oPKabJiTZSOhaauOrJ/IAFWRaIdMmtXnqS2A63GgkyqR17sPJNVC/l2UQ2Ti0tNJlL+djJSdxfeCTLNocGao6ssBmC30Fvtrm4IPFo6EFxD28Sx2GVd8NIBaMT018awt+jJsO+XJWjHpPY2uVuAxgzU5BAeaWUGqYG/iLR0VXkLdk2Pube9t5y3ZZV4Nl0iFrf5OmY2Za11eAjPUfQSS0mltws7B9i+knnuVYYh6LcVq36SnC+WcjnAGFembbpaxFRF0wiHEVD6A8B8nhG4QUaki2G/vqQx/5JwaQdlHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3109.namprd12.prod.outlook.com (20.178.54.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 13:59:02 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 13:59:01 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Topic: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Index: AQHVbrmfBkjv/NWpN0OB53VOOCihr6czBt7Q
Date: Thu, 19 Sep 2019 13:59:01 +0000
Message-ID: <BYAPR12MB280631BB2C0981BAFE4FE991F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
 <20190919071115.16552-6-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-6-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.159.93.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d84d3d03-f6bb-4044-8667-08d73d0986ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3109; 
x-ms-traffictypediagnostic: BYAPR12MB3109:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3109EE68F9BD214BDE90F869F1890@BYAPR12MB3109.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(13464003)(199004)(189003)(86362001)(2501003)(14454004)(66066001)(6636002)(186003)(478600001)(52536014)(110136005)(256004)(6116002)(3846002)(71190400001)(71200400001)(5660300002)(316002)(229853002)(9686003)(55016002)(6246003)(8936002)(8676002)(81156014)(81166006)(66446008)(64756008)(66556008)(66946007)(66476007)(76116006)(25786009)(33656002)(2906002)(99286004)(7696005)(76176011)(6436002)(6506007)(53546011)(74316002)(102836004)(26005)(486006)(11346002)(7736002)(305945005)(446003)(476003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3109;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O0JbGrlXCNEuKwkEwY7Qvj7GAIJHjLqcVw9iTrV48ei/q1odLrpnXHWcIrwJaLGK/WeyfF09NBELvWbdkd800Jr3UvGTgAM2R6jJwuB9lqgYjK9QBWVEcw5MWeCexg1cmQTaLC1m9xW5Xbcuowj3Or1mIiV11y+aUAisMMdQSTelwFL0V+4J0kcTsuqW2rkphJy0gH3+6727b5yVEK/rCcU5ZXMLTTkcB3+2dxX6uBhTR1hANuLaG/snLfPVHpjbTtj/Y0Zlp8/mN/rZ0qjGW+F8zLmKOu6XfH+IOk2KENDpDf6xlRsKKbIcC1ab52kvaKDGDRIUOvREKDhZhF/OeeGvdGJpiUtMcAYupqwAwTaUD8Szme7ncZer9o4i3TEO9kg/BLrU0iw+G94+IiHv0mVTe5boyV4FLNbhmgEtFjQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84d3d03-f6bb-4044-8667-08d73d0986ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 13:59:01.6679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: noL2wYfNtx4aLoPa2mch7VCcI9Snv+2eOT+7Gv3UdMp2eYnuAENkkL/bd/uFuCmyPCk0Avro9RuYuRXWqoUoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFWSQd9aWCMa7u8KiORJn3RPkMzx6Bqs8xuWoUUr7PE=;
 b=JhxomQyKKH/mSyu2eTBecd7SDmKFmrWGy0CpzR8XFEECB/FJKw2XdZHpXmFY5SqtjngHlT7ADFOCp/df432wIsL/Z7rEMpPWTVOeRx/p4jd02LGYslyvG71h0lOvRc10Hn7nisnLmgq2EqHnr1pS9l0Ka4mz6sVeHq9SvwT2m6E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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

CgoKUmVnYXJkcywKR3VjaHVuCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBaaG91
MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4gClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTks
IDIwMTkgMzoxMyBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENoZW4sIEd1
Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+CkNjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4KU3ViamVjdDogW1BB
VENIIDA1LzIxXSBkcm0vYW1kZ3B1OiByZWZpbmUgc2RtYTQgcmFzX2RhdGFfY2IKCnNpbXBsaWZ5
IGNvZGUgbG9naWMgYW5kIHJlZmluZSByZXR1cm4gdmFsdWUKClNpZ25lZC1vZmYtYnk6IFRhbyBa
aG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
ZG1hX3Y0XzAuYyB8IDMyICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3Y0XzAuYwppbmRleCBhOGU0YjdkODgwZmUuLmY2ODVhMjM3NzYxNSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTE5NDIsMjUgKzE5NDIsMjcgQEAg
c3RhdGljIGludCBzZG1hX3Y0XzBfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAl1aW50MzJfdCBlcnJfc291cmNlOwogCWludCBpbnN0YW5jZTsKIAotCWlm
ICghYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19fR0ZYKSkg
ewotCQlpbnN0YW5jZSA9IHNkbWFfdjRfMF9pcnFfaWRfdG9fc2VxKGVudHJ5LT5jbGllbnRfaWQp
OwotCQlpZiAoaW5zdGFuY2UgPCAwKQotCQkJcmV0dXJuIDA7CisJaWYgKGFtZGdwdV9yYXNfaXNf
c3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX0dGWCkpCisJCWdvdG8gb3V0OwogCi0J
CXN3aXRjaCAoZW50cnktPnNyY19pZCkgewotCQljYXNlIFNETUEwXzRfMF9fU1JDSURfX1NETUFf
U1JBTV9FQ0M6Ci0JCQllcnJfc291cmNlID0gMDsKLQkJCWJyZWFrOwotCQljYXNlIFNETUEwXzRf
MF9fU1JDSURfX1NETUFfRUNDOgotCQkJZXJyX3NvdXJjZSA9IDE7Ci0JCQlicmVhazsKLQkJZGVm
YXVsdDoKLQkJCXJldHVybiAwOwotCQl9CisJaW5zdGFuY2UgPSBzZG1hX3Y0XzBfaXJxX2lkX3Rv
X3NlcShlbnRyeS0+Y2xpZW50X2lkKTsKKwlpZiAoaW5zdGFuY2UgPCAwKQorCQlnb3RvIG91dDsK
IAotCQlhbWRncHVfc2RtYV9wcm9jZXNzX3Jhc19kYXRhX2NiKGFkZXYsIGVycl9kYXRhLCBlbnRy
eSk7CisJc3dpdGNoIChlbnRyeS0+c3JjX2lkKSB7CisJY2FzZSBTRE1BMF80XzBfX1NSQ0lEX19T
RE1BX1NSQU1fRUNDOgorCQllcnJfc291cmNlID0gMDsKW0d1Y2h1bl1Mb29rcyBubyBvbmUgdXNl
cyB0aGlzIHZhcmlhYmxlLiBDYW4gd2UgcmVtb3ZlIGl0IGRpcmVjdGx5PyBJIGFtIG5vdCBzdXJl
IHdoeSB3ZSBhZGRlZCBvbmUgc3dpdGNoIGNhc2UgaGVyZS4KCisJCWJyZWFrOworCWNhc2UgU0RN
QTBfNF8wX19TUkNJRF9fU0RNQV9FQ0M6CisJCWVycl9zb3VyY2UgPSAxOworCQlicmVhazsKKwlk
ZWZhdWx0OgorCQlnb3RvIG91dDsKIAl9CiAKKwlhbWRncHVfc2RtYV9wcm9jZXNzX3Jhc19kYXRh
X2NiKGFkZXYsIGVycl9kYXRhLCBlbnRyeSk7CisKK291dDoKIAlyZXR1cm4gQU1ER1BVX1JBU19T
VUNDRVNTOwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
