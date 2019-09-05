Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C80AAF1C
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 01:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4155A6E0DE;
	Thu,  5 Sep 2019 23:29:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C14D6E0DE
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 23:29:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6cIjPZ4+L1+rijA4mpSppRHEeOX8QgiaZDr/Jh0S0ezUwWXl+gMUt+1FZj0Rb4JW8Yw9v++cktbwzdYm1qCh3pOK5ufdC9Xltz4uLrl3UhNPQT5wfhrRz1Ws6MXM23te2jPiYp/ZX1ksHTrgrS0b+VhXKJ4VATjF8NqZlvA/blm0SGXtIdzkUEYzareMAOOQUBNpEQpsO5tCZwZPpG8VTr9y9+KMY5dt0qphg2eKcLjxoI0nDZn/Mtubzbia/IRtwTNJcXnKw9Wsex/IMFcu0of6Ln2+AW/GbikiX9GKZP+nVn8MgT5zE90Abv3MjLDsvq87YoF/LS48L91Kc0Krg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaBsIF/gp7jcD2xldRsNxTTFCtxEeF6pkU857jwfTgg=;
 b=f7FGQPTQ1yMvSWBklRQyji8xW7biIHbTnmG5/Ejm47AhxI31iSB6TZLC9gutD2XGihaby+G2n4zwQLY4MlINT45oZd5bgJFw40CbVM3Rd6XI/MNjrVkGlRshQPoaAqYIN9PKn0nySLtP5DV01Cd3De2N6tgJmqkgbRHbhuwkjbHWE66+vahRidpa6yY72qS4ld0UP8vrPhtcEVPkowxEtdxffitJ+h29VLLh0UD6+CUfL93QdH+XPJwmQk06fz9iFOpkjUVBsgoFQaA6ub30NNzX1BO6t8xGe3WUcISzLCINtG/ambyaO8RIjy6WZgssGDZmXxwp9XAdB1u5+HyNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3705.namprd12.prod.outlook.com (10.255.172.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Thu, 5 Sep 2019 23:29:27 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 23:29:27 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdgpu: Fix KFD-related kernel oops on Hawaii
Thread-Topic: [PATCH 1/1] drm/amdgpu: Fix KFD-related kernel oops on Hawaii
Thread-Index: AQHVZEHCWZgbepl5LU6w9xyNq+Uwiw==
Date: Thu, 5 Sep 2019 23:29:27 +0000
Message-ID: <20190905232915.5537-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::22) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dce7cd31-54a8-45ee-4357-08d73258e4e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3705; 
x-ms-traffictypediagnostic: DM6PR12MB3705:
x-microsoft-antispam-prvs: <DM6PR12MB3705495BAD458651576938F492BB0@DM6PR12MB3705.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:546;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(396003)(39850400004)(199004)(189003)(316002)(4744005)(1076003)(2906002)(186003)(2501003)(2351001)(5660300002)(26005)(5640700003)(66066001)(6436002)(6512007)(53936002)(52116002)(99286004)(476003)(486006)(66946007)(14454004)(2616005)(66476007)(66556008)(64756008)(66446008)(71200400001)(71190400001)(36756003)(25786009)(478600001)(14444005)(256004)(6506007)(8936002)(81166006)(386003)(7736002)(50226002)(8676002)(81156014)(102836004)(305945005)(6116002)(3846002)(6916009)(86362001)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3705;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: glCrKjAJVPkx8pLLOg1l1U7e3/iGg72nO6AryYM1cSkVSMKnDoMZB0QTbAq9hDZXoEjuYPxo0aFzNO3Lt4ShgprCEv3zLNmtW0kitiZlP+5l+WdSgV/GvWSMb5BAxHSIMPAHCONcLI6fIGfSJWI8T4OxT7v+NZ35qElEK837rDUwREoKQ7DX7ZtkWk36Xl5z1xmynFgo3eKu2OOjnw24x2UNm333g+XCom1sqyPLeCtfZ0j/BpuJEQis0Yq97xlcI+glPBlmpI/Jq8v6qaou3wa7aCWlF0VDA6/E4Zv3/R03VYutAJLzJyiHh5i0Vrn8T9dmfb0aXjCRBzk86TJAEuuUG7rrwKYgBccSx9UJX/ayLHCBpgwlJseNobaLKcYrOaTT8rkWvhAzmzDsV/u6kRruMAZ6oxPbAJJVJyWhyJU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce7cd31-54a8-45ee-4357-08d73258e4e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 23:29:27.6823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ugKZHxaRu/BDKKiE+kToH8Q8ef32BsgdlxrcDeArkDBNOr8Wmhouvdj5fvTY6yZV6I37P4wn1Q1k7ZfrPInAfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaBsIF/gp7jcD2xldRsNxTTFCtxEeF6pkU857jwfTgg=;
 b=anoEZj2F//b4C1KX0JxhPwQ99Up6ixqZOHlgHVuMuYM7N5vJhl9ySqYSeCUa8ykTA2zeDNLoQX3rTbE/KVdnUn0KshtYO46YzaVntkrHqgqwTOwpAaNxPz9/m2OQKivYOmKOAWraDJJ7LrdAw2nc775d/6RBEWMVbzZbA8FZhMY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

SGF3YWlpIG5lZWRzIHRvIGZsdXNoIGNhY2hlcyBleHBsaWNpdGx5LCBzdWJtaXR0aW5nIGFuIElC
IGluIGEgdXNlcgpWTUlEIGZyb20ga2VybmVsIG1vZGUuIFRoZXJlIGlzIG5vIHNfZmVuY2UgaW4g
dGhpcyBjYXNlLgoKRml4ZXM6IGViMzk2MWE1NzQyNCAoImRybS9hbWRncHU6IHJlbW92ZSBmZW5j
ZSBjb250ZXh0IGZyb20gdGhlIGpvYiIpClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxG
ZWxpeC5LdWVobGluZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCmluZGV4IDY4ODJl
ZWI5M2I0ZS4uZDgxZTE0MWEzM2ZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfaWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aWIuYwpAQCAtMTQxLDcgKzE0MSw4IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLAogCS8qIHJpbmcgdGVzdHMgZG9uJ3Qg
dXNlIGEgam9iICovCiAJaWYgKGpvYikgewogCQl2bSA9IGpvYi0+dm07Ci0JCWZlbmNlX2N0eCA9
IGpvYi0+YmFzZS5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dDsKKwkJZmVuY2VfY3R4ID0gam9i
LT5iYXNlLnNfZmVuY2UgPworCQkJam9iLT5iYXNlLnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0
IDogMDsKIAl9IGVsc2UgewogCQl2bSA9IE5VTEw7CiAJCWZlbmNlX2N0eCA9IDA7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
