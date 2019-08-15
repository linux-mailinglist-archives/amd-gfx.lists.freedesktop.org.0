Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAD18E88C
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 11:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51AE6E969;
	Thu, 15 Aug 2019 09:48:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710040.outbound.protection.outlook.com [40.107.71.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C46C6E969
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 09:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjG20Jin4iCPuPZ1xdPZPGcrM2nAi+Om8GwVRcgnkovUKnK8dR/a3zQM3PvddrJoi5E7yy8LqbKN5n79iSXzqmY1qtpN24ZM0gDkZpLGhbOTxIyv6XdWVGrGo4R7SEFvmUWm1KOf6guIrJ3QpcO7CLr9emwbTpEz7cv1wxlHaFxJwwEzz5pfCYbltkTUwSlCgkV/zfplUbtsJAF8tJcT/vI5oZaOp+Ip6THrDv3l7n+kENCoyvnkJ10jINzOTnDJG26EGyh/u3Xt7BGG7FWtFJAFSOoV2qHHHE8aQ4UMTJ90ABFPG2cZfDUu1iDOCAARXQ6C6DEE6ffec6EAOpH8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2NiLSCZK4YLJlLLr1YWdlM2Ph/BQdKpG8sqmja8cYU=;
 b=i/euEToNhdstkohenYH9ohv8uRrCfnT1E6BewSrvrp7otuPAXeRU6R2Lp+VD/FAcKRItgk3NGmpYJ97EqNEaBa4Nt4vxw3xMkGRrTiMtbI3fNtXX56vf7amQfrT0A5bBAv9grDLAV1wj2PDhiveWfB++C1L0NSqdARlvA6yGQOJrcMj9dmG1EAjlhERMEV0wSkrSHdRusJxmizGTYafF3J5aaCyN06UlhhwtJ5sZ2/Y+HHCpDDWE4fckTdQDbMYQe4dSr2Xj9lizQg04m3yIdhmfQVvlIe3+h/68UY8tzUKNtkqYVu2tLSRIYT/1C2cZXDRjAimZwsWQq1S3A+WOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3555.namprd12.prod.outlook.com (20.178.212.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 09:48:31 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 09:48:31 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: fix debug level for ppt offset/size
Thread-Topic: [PATCH 1/2] drm/amdgpu: fix debug level for ppt offset/size
Thread-Index: AQHVU06YOGenw6cNmEmG2ngcbxOG0Q==
Date: Thu, 15 Aug 2019 09:48:31 +0000
Message-ID: <20190815094815.20819-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0187.apcprd02.prod.outlook.com
 (2603:1096:201:21::23) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 782cbf10-18c4-4e7f-6067-08d72165bb17
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3555; 
x-ms-traffictypediagnostic: BN8PR12MB3555:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3555CDAE3886B41A7235A54C89AC0@BN8PR12MB3555.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:332;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(189003)(199004)(81156014)(3846002)(102836004)(6116002)(6436002)(81166006)(5660300002)(54906003)(52116002)(5640700003)(305945005)(478600001)(7736002)(71190400001)(71200400001)(86362001)(99286004)(2351001)(8676002)(386003)(6506007)(64756008)(66446008)(14454004)(66476007)(66946007)(2501003)(66556008)(476003)(2616005)(6512007)(2906002)(486006)(36756003)(256004)(4326008)(50226002)(1076003)(6486002)(26005)(53936002)(316002)(25786009)(4744005)(8936002)(186003)(66066001)(6916009)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3555;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jraBXM/oBUVIxP78yJJeQuY72kAKlTI6IQdd4I6oftpfRbP+YfGKNh3PaNVKhCR0jE79iLMei/eBextex/WzElP2o422v5eLTJA1yYpPM6RPYX9W6PjdDh+0fSOwU7OfyFOhNkIPJB/5pJDpAcomy59Oyi4pT0M/jN8iqIxsu79k5BsdRtzHYVpC1v+AmQrefna1ekuxRaq01ft3qd+1Q749Ctdh4JTI6cq7UQRaASPipkeXR/sh1EJW+OB3/CDE3SHf6s9vjHWmkeix+NjMRV3gVwCOFuqJOex5zF9j6WECyqYhlKLA64b0CLnknsBbUfHSWn3nrAzcBz18jUQyjS5ExRmwMEguiVRivS8+0YnBMma3e7296k0c2n+wLdlZPJp/h0g9mKW36DnU68SEKahaR6O748qxzsxcdsSX3S0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782cbf10-18c4-4e7f-6067-08d72165bb17
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 09:48:31.4806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 637iWcxylZXCGOcVbBrsgkbXkf0pgb/iv7AnTlIsZN8Hm/abe9a27QySP2B3sQTv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3555
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2NiLSCZK4YLJlLLr1YWdlM2Ph/BQdKpG8sqmja8cYU=;
 b=N708FmwJTHIBajNoaoiHwsWAq5Rg4wi7PQX+IG/lfk331IIwrww/k2V7npokyk4o19vonxM1Ch8taqGsCKKL+aLxkDSuqX9zjpJKGl2qP+8De6pIsm6Okx5hyP2a2qGUaXrIWsqim/TOH0rXWdwDkYWq9gk5oxZlPJZi4yrG6uE=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jCmluZGV4IDM1ZmQ0NmJkZmM1My4uODJmNmI0MTM3
MThiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYwpAQCAtODMs
OCArODMsOCBAQCB2b2lkIGFtZGdwdV91Y29kZV9wcmludF9zbWNfaGRyKGNvbnN0IHN0cnVjdCBj
b21tb25fZmlybXdhcmVfaGVhZGVyICpoZHIpCiAJCWNvbnN0IHN0cnVjdCBzbWNfZmlybXdhcmVf
aGVhZGVyX3YyXzAgKnYyX2hkciA9CiAJCQljb250YWluZXJfb2YodjFfaGRyLCBzdHJ1Y3Qgc21j
X2Zpcm13YXJlX2hlYWRlcl92Ml8wLCB2MV8wKTsKIAotCQlEUk1fSU5GTygicHB0X29mZnNldF9i
eXRlczogJXVcbiIsIGxlMzJfdG9fY3B1KHYyX2hkci0+cHB0X29mZnNldF9ieXRlcykpOwotCQlE
Uk1fSU5GTygicHB0X3NpemVfYnl0ZXM6ICV1XG4iLCBsZTMyX3RvX2NwdSh2Ml9oZHItPnBwdF9z
aXplX2J5dGVzKSk7CisJCURSTV9ERUJVRygicHB0X29mZnNldF9ieXRlczogJXVcbiIsIGxlMzJf
dG9fY3B1KHYyX2hkci0+cHB0X29mZnNldF9ieXRlcykpOworCQlEUk1fREVCVUcoInBwdF9zaXpl
X2J5dGVzOiAldVxuIiwgbGUzMl90b19jcHUodjJfaGRyLT5wcHRfc2l6ZV9ieXRlcykpOwogCX0g
ZWxzZSB7CiAJCURSTV9FUlJPUigiVW5rbm93biBTTUMgdWNvZGUgdmVyc2lvbjogJXUuJXVcbiIs
IHZlcnNpb25fbWFqb3IsIHZlcnNpb25fbWlub3IpOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
