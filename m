Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A2556263
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 08:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BED6E14A;
	Wed, 26 Jun 2019 06:34:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04C86E14A
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 06:34:20 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3522.namprd12.prod.outlook.com (20.179.66.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 06:34:18 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::b43a:f8f2:2865:dd58]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::b43a:f8f2:2865:dd58%7]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 06:34:18 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Topic: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Index: AQHVK+fJXp+C2SF0xkCEf4zbx9jaSqateYCo
Date: Wed, 26 Jun 2019 06:34:18 +0000
Message-ID: <BN8PR12MB36021167B2EBF7F48CE93CCA89E20@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190626062402.18551-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190626062402.18551-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b7e25f5-2884-4dac-c3a3-08d6fa0050ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3522; 
x-ms-traffictypediagnostic: BN8PR12MB3522:
x-microsoft-antispam-prvs: <BN8PR12MB35224F71157B3752EEC67C7789E20@BN8PR12MB3522.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(366004)(199004)(189003)(76116006)(52536014)(229853002)(305945005)(66066001)(26005)(186003)(102836004)(74316002)(316002)(5640700003)(446003)(2906002)(6436002)(8936002)(256004)(486006)(6916009)(11346002)(81156014)(99286004)(73956011)(3846002)(64756008)(66446008)(66946007)(14444005)(66556008)(6116002)(8676002)(66476007)(81166006)(7736002)(6506007)(53546011)(7696005)(76176011)(72206003)(71190400001)(71200400001)(478600001)(476003)(14454004)(33656002)(9686003)(5660300002)(4326008)(25786009)(6246003)(53936002)(2501003)(55016002)(2351001)(68736007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3522;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: le0n8Eq1U5Kdd3aGGEKEtx9qOTjiDDIFrO7V0GzU9rv9/emCu/0EKYf6b4gnrfS3ruzeoMWIAx9OrC14TCINrq1BjHz2SDIPS4LppXq7LiYWc63/LWbHAIqnDiUUYM5sWksrIzpkLOGFFjbEprZAP8qr1n7K9osbUxs3CIwRHZ46NzNVklLFAQQ8URLcaOY3qnhdZ3U3p6E1PkuZKqA4+OyKzK8xugA8o08BAnJHLSQttNZ9ZxCAf8ovCGIIDd0LRE9TXLC45HyAH0NGJcrQ4e3VxiDbWg+wQPFICyWGyuk6B0HjrSjG+HV5zcmYaLadMLQkaF4XMphvdwmYH6VcKXxXIzVZDhknCX8E3p+hqI8TtHc4bqnDvZIeLbIOMJ5HEodiMzO7e1fVXGEb37BXHATUNtkQilNcxezT4dvDY9o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7e25f5-2884-4dac-c3a3-08d6fa0050ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 06:34:18.3927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3522
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocnea51X6Wv9VwSD7OpyFxl4Nb7jjdl6Un1jzu/97xM=;
 b=LqACWdSFHQd4nZHpEykuupjev/MZl6a2hwegbHYu7UnlldUun2YIsWnVMh0tZgVUzcK6Sgls/C+EFQoaIM6uPs8IzrrTm48QRli8FXXXz2JBDT7lQ4QManDKxc9L9sulwD35FxkfjTizIKx3JFQQIMjMtPEM1HJ78yiIB4mOgGw=
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q3VycmVudCBTTVUgSUYgdmVyc2lvbiBjaGVjayBpcyB0b28gc3RyaWN0LCBkcml2ZXIgd2l0aCBv
bGQgc211MTFfZHJpdmVyX2lmLmggc29tZXRpbWVzIHdvcmtzIGZpbmUgd2l0aCBuZXcgU01VIGZp
cm13YXJlLiBXZSBwcmVmZXIgdG8gc2VlIGEgd2FybmluZyBpbnN0ZWFkIGEgZXJyb3IgZm9yIGRl
YnVnIHB1cnBvc2VzLgoKQlIsClhpYW9qaWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJvbTogWXVhbiwgWGlhb2ppZQpTZW50OiBXZWRuZXNkYXksIEp1bmUgMjYs
IDIwMTkgMjoyNDoxOSBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IFdh
bmcsIEtldmluKFlhbmcpOyBZdWFuLCBYaWFvamllClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9w
b3dlcnBsYXk6IHdhcm4gb24gc211IGludGVyZmFjZSB2ZXJzaW9uIG1pc21hdGNoCgpTaWduZWQt
b2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IGMzZjQ4ZmFlNmYzMi4uMzM5ZDA2M2UyNGZmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMjcyLDggKzI3Miw3
IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2NoZWNrX2Z3X3ZlcnNpb24oc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpCiAgICAgICAgICAgICAgICAgICAgICAgICJzbXUgZncgdmVyc2lvbiA9IDB4JTA4
eCAoJWQuJWQuJWQpXG4iLAogICAgICAgICAgICAgICAgICAgICAgICBzbXUtPnNtY19pZl92ZXJz
aW9uLCBpZl92ZXJzaW9uLAogICAgICAgICAgICAgICAgICAgICAgICBzbXVfdmVyc2lvbiwgc211
X21ham9yLCBzbXVfbWlub3IsIHNtdV9kZWJ1Zyk7Ci0gICAgICAgICAgICAgICBwcl9lcnIoIlNN
VSBkcml2ZXIgaWYgdmVyc2lvbiBub3QgbWF0Y2hlZFxuIik7Ci0gICAgICAgICAgICAgICByZXQg
PSAtRUlOVkFMOworICAgICAgICAgICAgICAgcHJfd2FybigiU01VIGRyaXZlciBpZiB2ZXJzaW9u
IG5vdCBtYXRjaGVkXG4iKTsKICAgICAgICB9CgogICAgICAgIHJldHVybiByZXQ7Ci0tCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
