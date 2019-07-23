Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7B71018
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 05:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A5489D5B;
	Tue, 23 Jul 2019 03:30:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760082.outbound.protection.outlook.com [40.107.76.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2CF89D5B
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 03:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VORzoMYKoTQbrGBO0ssa+Ywar2BkNy6du2s2SkABi67wF7UGjmGTvN1hIPy3ZAWMWtobCsFdduVA3DEoEF/I5sVd2uOs4myA78Llc/hzoykcUP6yXYGiPKNkbuSs46MDVUy8ThWGd8yhZnblKS0T4RoQKso6e2IMSvRLxdenpsvlCiDxam3rzup5JxCkxI58Ho/HeM2pmk9gty81adnCvf+p+uh03OND9cju9+0aoSq+bDvkfKkwNojzwLs1IntDBaEzlo03o8wRAwipOO39RZWCsn5MmJ+0diCGHBShQdP7XQpC14KY47dFh3s0PhImzVKlpgMU+lwXU8871dkhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbmh9nUPCzKLGaPFIcDUcCoQF7l3HWP8R2V9dBJYFVY=;
 b=Cx6coyXzpBgA6FxpTruEFUZdIx4Ey967nf55o6zjcN1VeFAyaz27CjTHm/I0Xb612JPNBo6iM+HQXlTVrDwItT7DtncpdcpI3cyLi9jDcm2+S7tKQd60yvMw0a/Ho2+QW6PNavb/rmEhGZ1fEIZGw6o2cj1BWOamjFtAq4nZsc8qxWJleAhcyvgVg1XznbPTRKtL+/7coEWsTPZSSC4LCg1KVTmCBuCR3a3OB9zo9PyhEUUiQIzNpRWuPwOoZI9LwSWuHddu/rrHEQ9FJuZPlTHfzLc95a81J9sQ8Luo+rqvPEGyONsxG8kFXIYyLkmwhnmuxv3F/aYUEfH5qwHbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2815.namprd12.prod.outlook.com (52.135.107.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 03:30:45 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4c4f:4a38:712d:928d]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4c4f:4a38:712d:928d%5]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 03:30:45 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Also reserve bad pages after gpu reset
Thread-Topic: [PATCH] drm/amdgpu: Also reserve bad pages after gpu reset
Thread-Index: AdVBBtyeAkOvO4PJSk2x/9SInwW17Q==
Date: Tue, 23 Jul 2019 03:30:45 +0000
Message-ID: <SN6PR12MB2800D574892ADB78A475241587C70@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90770941-40cb-4782-b0fe-08d70f1e261a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2815; 
x-ms-traffictypediagnostic: SN6PR12MB2815:
x-microsoft-antispam-prvs: <SN6PR12MB2815C51E2586BB3C3F98738587C70@SN6PR12MB2815.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(6436002)(5660300002)(8936002)(86362001)(55016002)(76116006)(66066001)(316002)(54906003)(102836004)(66946007)(4326008)(5640700003)(486006)(33656002)(8676002)(3846002)(6916009)(74316002)(7696005)(9686003)(6116002)(81166006)(2351001)(25786009)(81156014)(68736007)(66556008)(66476007)(71200400001)(99286004)(66446008)(52536014)(2501003)(305945005)(2906002)(478600001)(7736002)(476003)(64756008)(256004)(26005)(4744005)(186003)(14454004)(53936002)(6506007)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2815;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eeL9tcCL/6YmHcSAm3wvtESM1w0+P8DMzu0Qyg7ATWMc3cploXv3OYD7KbvQXlo2xMp6Pt9qbOF0z+4fk3ltvtkpta21ZFFhGrRUOXtaM217GwcxXaDyRVEXEzWOYH7MPnm4JYKMebYTzezNfz7UcmKY0JOaSRz6oOKkO8zFLx99XRNYQvVcAGQQmqWVl+NRvaqBOU4E9fxAa71yl1Ew1D7IHJliW89rCIAucCymdYKQuqKXWDG3dnjdMHYYG105dzIchWnvFe4Yy314hl3Q3I/d253UUW+5A/iaGf3SuCJzh1/W+tc4mf/Jl2cextfB+KCw1Nk9TomaPENuoXY5vScQGiniEW1tkzlfoLPgSx1qkfCPVkItCc077ozUMW6Ms9ySku50lw9hD1l1qzktTl7G6LgYQSl8VztXJgNRL64=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90770941-40cb-4782-b0fe-08d70f1e261a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 03:30:45.7404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2815
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbmh9nUPCzKLGaPFIcDUcCoQF7l3HWP8R2V9dBJYFVY=;
 b=dgD3JMyBKJrecf9lZxlWWkkdaSZsr6kwq4L9wjLLcsr/rFujKOyJy7OMMT/7uoeyWhEOtJMjk/02eVafidgpYakVaoRiHcY2ifccMktnuH7FFt/Jz55WVBTeGkwiy/i3xP3CGERJGdQy0TpWmH1QY/sBshKSOk8wV7lyHuIzrmQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gY2FzZSB3ZSBhZGQgYmFkIHBhZ2VzIGR1cmluZyBncHUgcmVzZXQuIEJhZCBwYWdlcyBtaWdo
dCBub3QgYmVlbgpyZXNlcnZlZCBpbiB0aW1lLgoKU2lnbmVkLW9mZi1ieTogeGluaHVpIHBhbiA8
eGluaHVpLnBhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggMjMwYzA2ZTYxOWVkLi43MDliNTJl
NmViYWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTEyNzEs
NiArMTI3MSw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfZG9fcmVjb3Zlcnkoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQogCiAJYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihyYXMtPmFkZXYs
IDApOwogCWF0b21pY19zZXQoJnJhcy0+aW5fcmVjb3ZlcnksIDApOworCS8qIGluIGNhc2Ugd2Ug
YWRkIGJhZCBwYWdlcyBkdXJpbmcgZ3B1IHJlc2V0LiAqLworCWFtZGdwdV9yYXNfcmVzZXJ2ZV9i
YWRfcGFnZXMocmFzLT5hZGV2KTsKIH0KIAogc3RhdGljIGludCBhbWRncHVfcmFzX3JlbGVhc2Vf
dnJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
