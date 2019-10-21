Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA64DF618
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 21:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10856E237;
	Mon, 21 Oct 2019 19:37:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820078.outbound.protection.outlook.com [40.107.82.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36B16E237
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 19:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eF95TRxo9+NkNqk5yUU+q+SauT08HQDVQ9W4BfczmSZwsWA5JTcmwJu1DlQJwaJzLGER6o95RJRGxKxWXZIg9alHqJ16Q2gWmQlk7PDB8QfQMGurDh3O9kTn/PTTzwFIS980+msIKVnUbZXetXpiwVE7Sg6uJYsQCUsew5oeUAZU5bwwWYJDsg73B5rHyLWa0bWqFiH1NEqfBig5rUX6Q97xp/dwCAIVKJIAHeADU46dBdkgv5a2WJ1/L058Fd6NWFLaCzCDI/+QTvwddydaCFN3GNhs4jNIhEE0TGhxhsnFnfcqDg2eogUm8AtF9NDCJVMVBtocUraimql3fBnQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yOCZB3cZDx7xTB70GejW1HKgvo9kos65wMvQledwgI=;
 b=jeNCCATXCyvIX+1pP1k/+476lu3OmFO7emIIejOoR0esSmBLh7umIYB/N1Sjr58M0e0A/O8Cl3/PT8GJt4329aWvmGI7avnRlfHvj2R/vUTChVBdUUkENLUIH7HmZu+NHDJVMtIMsYjpMoRQFtTThGelCPWXUN2N1xXUyVEeYfjS2Zpj+lwTN+bob7On+zIR0eVRHbKO1WfezqzUM4+retJ7TydZPlTx3SwQ8MdI2c/srcZhqJO2F6zWK8iMIs/AZCd1yllvnSnQPGB1S9FehYb3o01sOWL4lt10r5b1Hu+vTLfubfJiWtKDqrGkofgNaSNzcVGKiZb5tKTV5zWgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB2811.namprd12.prod.outlook.com (20.176.117.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 19:36:58 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 19:36:58 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Zhan" <Zhan.Liu@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>, "Li, Roman"
 <Roman.Li@amd.com>, "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Subject: [PATCH] drm/amd/display: Change Navi14's DWB flag to 1
Thread-Topic: [PATCH] drm/amd/display: Change Navi14's DWB flag to 1
Thread-Index: AQHViEa82Cgl8MseMUW0cN63V7ojoA==
Date: Mon, 21 Oct 2019 19:36:57 +0000
Message-ID: <DM6PR12MB346608E72303400E56A5C8AE9E690@DM6PR12MB3466.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95df519d-5e32-4705-dea8-08d7565e095e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2811:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2811D4F55F0B07071F4226859E690@DM6PR12MB2811.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(199004)(189003)(6436002)(25786009)(110136005)(9686003)(6306002)(14454004)(74316002)(5660300002)(3846002)(6116002)(316002)(7736002)(66066001)(305945005)(2906002)(2501003)(52536014)(102836004)(7696005)(186003)(966005)(81166006)(6636002)(8936002)(8676002)(81156014)(66446008)(478600001)(14444005)(256004)(6506007)(99286004)(26005)(86362001)(476003)(486006)(33656002)(71200400001)(66946007)(64756008)(91956017)(66476007)(66556008)(55016002)(76116006)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2811;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GFhMH8FgsVU3HrJjVyFjI6uC7dg2OP52RN+dbZ6o9lnx+CdEOngz6we/SiuAsg/oYQfnulHAJ8w9Fc/a5hzJHrxLRIUWk/hhRJfpAcgsujOSmsD3qYCpA1JfBd2raUOZbMySF8JnB/GciIHVvoQv2Yjrs44nVJChBFOJNIhwSWIil/zWkSKcNdzN2FSE/0BWF0n2rKrgj9fsllcuG/9+aDYlJNRGBh4vsgzj/LCRo09XMGLZNyL7ZYt3VletSs2UmRvPD7LawvsvzZQ2sRvrfkIAInDv9FRE/mqYmiNVAKTEeiKlMCqmsj8KcuKeR5Ca+qzfhNqjZh4HGgCjMqWqXyiQkaFCmMR7KT8GzfxQN3+YR1rkyIAvi6U0VARd7VJXZmcEMrs5Vl5+tb3w/31K7NZOPimWBxo3I8ILwU6oc1ejE/Kd6gBc89l66fsyzqewxmPMxOskhoI6nPhFBeNOAA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95df519d-5e32-4705-dea8-08d7565e095e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 19:36:57.9401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uq6neCqt79qIF37q5H909BgrbMxowsJcCPpltz2LBk5Etcrr4eIbwWj9UzjIbQY2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2811
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yOCZB3cZDx7xTB70GejW1HKgvo9kos65wMvQledwgI=;
 b=pvdiwQOQGP6xOWClMyoFAijSRkPtgm5aqkzFHk7ioRunDovg7lPWOEq2AZ5b0Y0dlXYkhFWXGD3OzvuGsy/C5dkg936wp1/3ICU/HYbyT2NjmnkzZ0YdFe5dpR+e1n5aTxw70TNY/eQKkV2IptFojpZUhUQ6fmGXPjJOcWv22ZM=
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

W1BBVENIXSBkcm0vYW1kL2Rpc3BsYXk6IENoYW5nZSBOYXZpMTQncyBEV0IgZmxhZyB0byAxCgpb
V2h5XQpEV0IgKERpc3BsYXkgV3JpdGViYWNrKSBmbGFnIG5lZWRzIHRvIGJlIGVuYWJsZWQgYXMg
MSwgb3Igc3lzdGVtCndpbGwgdGhyb3cgb3V0IGEgZmV3IHdhcm5pbmdzIHdoZW4gY3JlYXRpbmcg
ZGNuMjAgcmVzb3VyY2UgcG9vbC4KQWxzbywgTmF2aTE0J3MgZHdiIHNldHRpbmcgbmVlZHMgdG8g
bWF0Y2ggTmF2aTEwJ3MsCndoaWNoIGhhcyBhbHJlYWR5IGJlZW4gc2V0IHRvIDEuCgpbSG93XQpD
aGFuZ2UgdmFsdWUgb2YgbnVtX2R3YiBmcm9tIDAgdG8gMS4KClNpZ25lZC1vZmYtYnk6IFpoYW4g
TGl1IDx6aGFuLmxpdUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCA5MTRlMzc4YmNkYTQuLmQ0OTM3
YzQ3NWU3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTgxNiw3ICs4MTYsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJlc291cmNlX2NhcHMgcmVzX2NhcF9udjE0ID0gewogICAgICAgICAgICAgICAgLm51bV9h
dWRpbyA9IDYsCiAgICAgICAgICAgICAgICAubnVtX3N0cmVhbV9lbmNvZGVyID0gNSwKICAgICAg
ICAgICAgICAgIC5udW1fcGxsID0gNSwKLSAgICAgICAgICAgICAgIC5udW1fZHdiID0gMCwKKyAg
ICAgICAgICAgICAgIC5udW1fZHdiID0gMSwKICAgICAgICAgICAgICAgIC5udW1fZGRjID0gNSwK
IH07CgotLQoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
