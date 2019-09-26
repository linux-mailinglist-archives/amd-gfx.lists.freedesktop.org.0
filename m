Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D476BBF26A
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 14:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEEE6ECEE;
	Thu, 26 Sep 2019 12:03:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55A16ECEE
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 12:03:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3bFHy1WWBcEZNXMueSnClL2StTzoILlUMaC69lwDXJGIud+Dzmdm/kbNaq/w0n59238ne/XXxS7nAeSVpeBqXsg79LpQ6tKg9ZRksNcmPuWWH4XNdcyNwXgw2tbmI/MF3CoF+NsQ1r9O2O3akbVd5vELErxnCLV/pMR3j/Iev4Em8C+XW43B4shmTBbl6KpgXprIQMVhjE6jzk3Yabptcvcquph7CPw219vcl0sakLiM/8lGRrLFKI7Xs8IXmbL+Day+VEuAzm+s1vj6BODGxoy88lLfdKrmCVjBO4K0TvB7DVJ/Ix9tj5TNuqoFrxtdI3ymS0ACeU4xorzwwWS1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRfts/7a478QloPIfnq2S2TjH8n0d+PsimJoiruiqR0=;
 b=GwyjnAiDoYx/myShOghCUw+9sL6jO5ZjL5Yz3xLL3AISXnqhvxh/LKsX0QARvud8ONI68XNcu67XLwGVXaq6ay8JLN91hFt1GD1gc6xgJg/eP/PDOF5oqMa+8YIl6vfV+BLvF72JONxhc+xTEmyNmHsdavxIm6nlNLSDQrXM42/jSD4yQK87J5NL+QRdc45w9L/IdTXhTZ16cvR/eytkKkRssSRfiUNpqbU6bYvyc3lp7j78/N2TvE8C6I5LAZsiKEA2TiMXY9lRGU3L/gSouwuHtbNciRJ/lRQpjBgzHVMxLdA0T1gzXMB9GQIrp36GwAtmnblfI3gvvCsbqinawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3470.namprd12.prod.outlook.com (20.178.244.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Thu, 26 Sep 2019 12:03:52 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 12:03:52 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 6/8] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Topic: [PATCH 6/8] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Index: AQHVdB2BYRt8L0CXHUy0PzKphGZKRqc93Cbg
Date: Thu, 26 Sep 2019 12:03:52 +0000
Message-ID: <MN2PR12MB334480BF049405A9A2166243E4860@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>
 <1569469774-16813-6-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569469774-16813-6-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df790258-9ae7-4cbe-1fd5-08d74279997f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3470; 
x-ms-traffictypediagnostic: MN2PR12MB3470:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3470DB7EF57DF99FED0E61B3E4860@MN2PR12MB3470.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:58;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(13464003)(189003)(199004)(52536014)(478600001)(11346002)(446003)(5660300002)(476003)(6116002)(3846002)(55016002)(14454004)(486006)(26005)(99286004)(53546011)(76176011)(7696005)(6506007)(54906003)(86362001)(14444005)(256004)(71190400001)(71200400001)(66476007)(229853002)(6436002)(2906002)(186003)(102836004)(110136005)(66556008)(316002)(66946007)(66446008)(76116006)(25786009)(64756008)(33656002)(7736002)(74316002)(305945005)(66066001)(2501003)(6246003)(8936002)(4326008)(8676002)(9686003)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3470;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3105YxI2QGMK0WlKCMzCd0iHMT8SfiHpQ+8KVMSbHH4Zu6PG2SlTOM5AqIPBStxazfUhRNvgHLYESsxnHy6sdj6iQxFEavrjjSZlB43gg4cQ86WitUFcJvjkKWn734VwA6f4OZxp9f6KIAH8klGcrS/DR34s/ZAcpi8FlG1iDeewBZN5gQLBDTyBaerIrPS2A0OTMhEcMbTF7iv32oyB3Paf0xnIuW8wOwxfxk6L8RGOQs5vveDe9SwagBXbRViveDGa/vehmudmEgdAwKOckzUkWVTlvPG46A0tb2vjKLsSlAwJgTnDGFx/G7mGhYglsF0PIQM+HqkrASQWgQcXCrBjkfmRLpvcRqbXHmdshzcd0tBt/8MzCyJXnzL0al5Nf2G8jbMU+vVroEhkmxmnkmewAkScFrPn6iC8eYbQARs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df790258-9ae7-4cbe-1fd5-08d74279997f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 12:03:52.8956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QT2msut/hxWiKQvJ+FPaMQkT5Z7hA7fL3kDec7V1b3Bu3ySg4kBsuk4AGgsg067
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3470
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRfts/7a478QloPIfnq2S2TjH8n0d+PsimJoiruiqR0=;
 b=dtguSq/pmogb4dTPUHxlCSUBQoUkrWXQ7GluC8ij63Yavwz5nZ50vP5v47VQK4kGOIRaFyvuU1YNlzO5vBPR7z51LjAqlmFn22rkKdaWuDWxpQKWMJ3LwAvvNZVPidvAluhrXmuFjlT536gq3PKhcxU9qGFo5qIL5dilgQ3nQ5U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "keneth.feng@amd.com" <keneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCB0aGUgZm9sbG93aW5nIGFkZHJlc3NlZCwgdGhlIHBhdGNoIGlzIHJldmlld2VkLWJ5OiBF
dmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0K
RnJvbTogTGlhbmcsIFByaWtlIDxQcmlrZS5MaWFuZ0BhbWQuY29tPiAKU2VudDogVGh1cnNkYXks
IFNlcHRlbWJlciAyNiwgMjAxOSAxMTo1MCBBTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsga2VuZXRoLmZlbmdAYW1k
LmNvbTsgSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBMaWFuZywgUHJpa2UgPFByaWtl
LkxpYW5nQGFtZC5jb20+ClN1YmplY3Q6IFtQQVRDSCA2LzhdIGRybS9hbWQvcG93ZXJwbGF5OiBp
bXBsZW1lbnQgaW50ZXJmYWNlIHNldF9wb3dlcl9wcm9maWxlX21vZGUoKQoKQWRkIHNldF9wb3dl
cl9wcm9maWxlX21vZGUoKSBmb3Igbm9uZSBtYW51YWwgZHBtIGxldmVsIGNhc2Ugc2V0dGluZyBw
b3dlciBwcm9maWxlIG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlh
bmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0
LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAz
MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvcmVub2lyX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3Bw
dC5jCmluZGV4IDRmMmI3NTAuLjE1MWQ3OGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9yZW5vaXJfcHB0LmMKQEAgLTQ4Miw2ICs0ODIsMzUgQEAgc3RhdGljIGludCByZW5vaXJf
Zm9yY2VfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlyZXR1cm4gcmV0Owog
fQogCitzdGF0aWMgaW50IHJlbm9pcl9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCBsb25nIAorKmlucHV0LCB1aW50MzJfdCBzaXplKSB7CisJaW50IHdvcmts
b2FkX3R5cGUsIHJldDsKKworCXNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlID0gaW5wdXRbc2l6ZV07
CisKW1F1YW4sIEV2YW5dIG1vdmUgdGhpcyB0byBwbGFjZSBCLiBUaGF0J3MgdG8gdXBkYXRlIGN1
cnJlbnQgcHJvZmlsZSBtb2RlIG9ubHkgd2hlbiBpdCdzIHZhbGlkLgorCWlmIChzbXUtPnBvd2Vy
X3Byb2ZpbGVfbW9kZSA+IFBQX1NNQ19QT1dFUl9QUk9GSUxFX0NVU1RPTSkgeworCQlwcl9lcnIo
IkludmFsaWQgcG93ZXIgcHJvZmlsZSBtb2RlICVkXG4iLCBzbXUtPnBvd2VyX3Byb2ZpbGVfbW9k
ZSk7CisJCXJldHVybiAtRUlOVkFMOworCX0KKwpbUXVhbiwgRXZhbl0gIHBsYWNlIEIKKwkvKiBj
b252IFBQX1NNQ19QT1dFUl9QUk9GSUxFKiB0byBXT1JLTE9BRF9QUExJQl8qX0JJVCAqLworCXdv
cmtsb2FkX3R5cGUgPSBzbXVfd29ya2xvYWRfZ2V0X3R5cGUoc211LCBzbXUtPnBvd2VyX3Byb2Zp
bGVfbW9kZSk7CisJaWYgKHdvcmtsb2FkX3R5cGUgPCAwKSB7CisJCXByX2VycigiVW5zdXBwb3J0
ZWQgcG93ZXIgcHJvZmlsZSBtb2RlICVkIG9uIFJFTk9JUlxuIixzbXUtPnBvd2VyX3Byb2ZpbGVf
bW9kZSk7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCXJldCA9IHNtdV9zZW5kX3NtY19tc2df
d2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfU2V0V29ya2xvYWRNYXNrLAorCQkJCSAgICAxIDw8IHdv
cmtsb2FkX3R5cGUpOworCWlmIChyZXQpIHsKKwkJcHJfZXJyKCJGYWlsIHRvIHNldCB3b3JrbG9h
ZCB0eXBlICVkXG4iLCB3b3JrbG9hZF90eXBlKTsKKwkJcmV0dXJuIHJldDsKKwl9CisKKwlyZXR1
cm4gMDsKK30KKworCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3Bw
dF9mdW5jcyA9IHsKIAkuZ2V0X3NtdV9tc2dfaW5kZXggPSByZW5vaXJfZ2V0X3NtdV9tc2dfaW5k
ZXgsCiAJLmdldF9zbXVfdGFibGVfaW5kZXggPSByZW5vaXJfZ2V0X3NtdV90YWJsZV9pbmRleCwg
QEAgLTQ5Niw2ICs1MjUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVu
b2lyX3BwdF9mdW5jcyA9IHsKIAkuZ2V0X3dvcmtsb2FkX3R5cGUgPSByZW5vaXJfZ2V0X3dvcmts
b2FkX3R5cGUsCiAJLmdldF9wcm9maWxpbmdfY2xrX21hc2sgPSByZW5vaXJfZ2V0X3Byb2ZpbGlu
Z19jbGtfbWFzaywKIAkuZm9yY2VfY2xrX2xldmVscyA9IHJlbm9pcl9mb3JjZV9jbGtfbGV2ZWxz
LAorCS5zZXRfcG93ZXJfcHJvZmlsZV9tb2RlID0gcmVub2lyX3NldF9wb3dlcl9wcm9maWxlX21v
ZGUsCiB9OwogCiB2b2lkIHJlbm9pcl9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
