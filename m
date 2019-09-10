Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D30AF205
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07606E986;
	Tue, 10 Sep 2019 19:47:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740072.outbound.protection.outlook.com [40.107.74.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7366E986
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:47:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiAh5F5da9j/UBntH8Qxdsma6AOGY5rgGnisqu6gG7pB2OIA8nJDHzBXwkqUuCSwjFA0yDv7Ff61Z59/rS1HoZsKtywdphZcCYr6Z1GsCMAU2PxxhvVejm0RRF8KeFNjPIQtFvhDL97pggcOabYBPy6Km/S31ZZqXIRucg3MrbpRLlUN+x2CYQ5rBiKKqlzIOrmk5wFDInFzJdArOF1vqXIqt9nZnl2keBwRJ2l03K7TVeaEAJYqUAomiv8Z5LZAAO8LrFfNLRgbiztbH7SEzZQMrbgGzKZmjap1gNqelYsDK6c/5kJO6UJmacXR4h5wFdun3LXoTAukJlFKbGJ58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrtKi8XsHIesN/42e+S1xpwwo2iXme8f9JqereLnIXc=;
 b=Hbtm6WnshBu0/MeNfZsCi/ZUlEbeJT62xhVG4VxZh6vHyYcYlSulbb8YdYqUah5bMNfgb5TUdN5Dm2FUKWP0c0kwOk2KV50IFvyAnnmtIT/0UorTF/uBON27DsCstSq28tyHNYYIbfp6wgCyhO2D85yZc7Uib393JyMZmxJ/bPknoZOMF9Yza7QXveHiQa33NfnVUA01YO2LJwi9IYiRsba54h16Jl0TtyMAtQbd6xerTB00rlHjrhJoV3jIBkaMEW8QE9kPjbUr3Xf6zUBN0Y3crFa/FiMQJuH9hrej7HJa3OJCfPsJsaTvxukMlWlfdAKP31jW11Zttql5gB+uew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1144.namprd12.prod.outlook.com (10.168.168.7) by
 CY4PR12MB1928.namprd12.prod.outlook.com (10.175.82.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 10 Sep 2019 19:47:30 +0000
Received: from CY4PR12MB1144.namprd12.prod.outlook.com
 ([fe80::1dfa:f5ce:945f:2509]) by CY4PR12MB1144.namprd12.prod.outlook.com
 ([fe80::1dfa:f5ce:945f:2509%4]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 19:47:30 +0000
From: "Grigorev, Slava" <Slava.Grigorev@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Fix Xorg abort on exit in RHEL 7.7+
Thread-Topic: [PATCH] Fix Xorg abort on exit in RHEL 7.7+
Thread-Index: AQHVaBCUK9pc6dFDykO8mkGiaCCdfw==
Date: Tue, 10 Sep 2019 19:47:30 +0000
Message-ID: <20190910194637.29819-1-slava.grigorev@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To CY4PR12MB1144.namprd12.prod.outlook.com
 (2603:10b6:903:3f::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75a6b8bc-a0ef-417a-9a3d-08d73627b74f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1928; 
x-ms-traffictypediagnostic: CY4PR12MB1928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1928EE6109C347C366590B288FB60@CY4PR12MB1928.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(199004)(189003)(5660300002)(316002)(3846002)(1076003)(50226002)(102836004)(64756008)(86362001)(6116002)(66066001)(81156014)(81166006)(66556008)(14444005)(66446008)(256004)(8676002)(66946007)(26005)(476003)(486006)(71190400001)(2616005)(36756003)(71200400001)(6916009)(66476007)(2351001)(19627235002)(52116002)(99286004)(6486002)(478600001)(386003)(6506007)(14454004)(4744005)(2501003)(6436002)(186003)(7736002)(25786009)(8936002)(2906002)(5640700003)(305945005)(4326008)(6512007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1928;
 H:CY4PR12MB1144.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ATXPVoRClHl5Aa7Zjyf7qLFkuYCUVVaiTrN0b6y38zHbC9oI9hoSQkwpL1J2mdiL4iATR6J8lb+91J0piwmHyrSDuaHDiHMs8SUrWM+nPBVdlN28s+srKwcoCwj74R+sqcj4rMOClO5BdOBZvIvXBQ5H6UIqnZtz8pfkTCfInHr5wec6a7Za6dIx6iQyWQJoGJe3HZLHc9l9+Bdupx00ebUFg4muhr8C5wZCrTrlm8oCik6NRdWoyacvjMQcH6gSOCTW5EKq4IRjigZ+9gh+yNaTBTRae8U2m2j6gxC41joLvVwP3CIvSJ/LZpBRY+4UKJkvKLssHhDj4x9KUO+XvBgW9XMNGk/NiRjcE3tTK47LkSGMaDI/2TnVlpZWUWQCbKNtQyNHPpfn18xTw0SooV7tXxQp9kbfuAKVWItpN6c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a6b8bc-a0ef-417a-9a3d-08d73627b74f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 19:47:30.7184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /6xwgF/DVbEzK85+BXE7GcHJ+Qbf9OrI0GJzw7qdFmaWl68MK253MTee2bSQxCAyryyIDSXE7i9yKBnvIpH6pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrtKi8XsHIesN/42e+S1xpwwo2iXme8f9JqereLnIXc=;
 b=EBrD7055+ZX8JIH+fvWyy36gm2RZ5x88/i+d3Uj4AnSIAjJL7XOpkRVaY9vR/qTRV5KIpf6DSfKEd1l9qc3YG5lTQxoNf167bABBm93S9f8QL0vKyZUWDaHnQxwjif8agy2GIUkIgBld6S8gKuc0NZGCvZ3AglcvQ0hYdBAxC1s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Slava.Grigorev@amd.com; 
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
Cc: "Grigorev, Slava" <Slava.Grigorev@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UkhFTCBhZGRzIGFuIGV4dHJhIExlYXZlVlQgY2FsbHMgdG8geGY4NkNydGNDbG9zZVNjcmVlbiB3
aGVuIHRoZXkgYnVpbGQgWCBzZXJ2ZXIKZm9yIHRoZSBwdXJwb3NlIHRvIGRyb3AgZHJtIG1hc3Rl
ci4KClNpZ25lZC1vZmYtYnk6IFNsYXZhIEdyaWdvcmV2IDxzbGF2YS5ncmlnb3JldkBhbWQuY29t
PgotLS0KIHNyYy9hbWRncHVfa21zLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zcmMvYW1kZ3B1X2ttcy5jIGIv
c3JjL2FtZGdwdV9rbXMuYwppbmRleCAzMjgwOTcyLi45ZWZjNDgyIDEwMDY0NAotLS0gYS9zcmMv
YW1kZ3B1X2ttcy5jCisrKyBiL3NyYy9hbWRncHVfa21zLmMKQEAgLTIyODUsNyArMjI4NSw5IEBA
IHZvaWQgQU1ER1BVTGVhdmVWVF9LTVMoU2NybkluZm9QdHIgcFNjcm4pCiAJCQkJc3RydWN0IGRy
bW1vZGVfZmIgKmJsYWNrX2ZiID0KIAkJCQkJYW1kZ3B1X3BpeG1hcF9nZXRfZmIoYmxhY2tfc2Nh
bm91dC5waXhtYXApOwogCi0JCQkJYW1kZ3B1X3BpeG1hcF9jbGVhcihibGFja19zY2Fub3V0LnBp
eG1hcCk7CisJCQkJaWYgKCFkaXhQcml2YXRlS2V5UmVnaXN0ZXJlZChyclByaXZLZXkpKQorCQkJ
CQlhbWRncHVfcGl4bWFwX2NsZWFyKGJsYWNrX3NjYW5vdXQucGl4bWFwKTsKKwogCQkJCWFtZGdw
dV9nbGFtb3JfZmluaXNoKHBTY3JuKTsKIAogCQkJCWZvciAoaSA9IDA7IGkgPCB4Zjg2X2NvbmZp
Zy0+bnVtX2NydGM7IGkrKykgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
