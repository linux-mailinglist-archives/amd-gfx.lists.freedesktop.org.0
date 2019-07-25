Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22CF750FC
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 16:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0B06E65F;
	Thu, 25 Jul 2019 14:25:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720041.outbound.protection.outlook.com [40.107.72.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2245D6E65F
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 14:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0D4k6CydYphJkCeGrVHSJExdnuBMyiqzfqF/VxOK5dWbfF2UlhJOSUSc+UlZiW8qikmpgpKV8eh0VmJKR6bCdagQnJuXDJlP/9FV9FXSnV7Ndj6ZrQzGDc1UQEqfBDCOJSTclHQcM/pncmEP49PQZNWurwG552je4lyouY85LnpvQ4Z/I+Fp93DS4YW4yUYpnnKzdwtI3LJryFCOe3eQjTcTTRNOECaa4bjUh34wfOt/vOsKR1mprhe0qEZAauKth0F5QoL8XCaKt93KCyEZX7Fa0RnfvaW7dechO9KTXme8cBss7Qou1yvqq/7bUFfYZkiOOTxeVQwdRkgbYd6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga4IcX+A4QRReMi8CKrSnnLK+c4A5HX+VMZaAk2rbIs=;
 b=QIAa0efM6h+ir/1ZPu9d6Nr+ZdZH9q8yLri9FJ+w384HmPivckh5KrClkuWvOE3Vdj39M1ngGQITrnWGFe4zfszKDkgznhNJO4rxZpyW9nOtkAfMeqjnSpeRZaZTTvqeRHLFQpnKP7uk5TgOUP9UGBNRUmJ1Q8QYnlG4huoIs6xAyxVNtUT2v1RHSbA8Wlt4TjqHc2zakDiWqFRsojFYZx2lZZAOjyTCIf7xlNfPIgjnBN+BhsMoVWjnb6MaJt6DrL91CHvZM+RkzqBW8WMtYKcTLPOU4Jax1ro/uLA+x+yDEDlwUkNby75HASqqVt0IAPvX37/6252aXfyFQoiVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=daenzer.net
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0063.namprd12.prod.outlook.com (2603:10b6:0:56::31) by
 BN6PR12MB1569.namprd12.prod.outlook.com (2603:10b6:405:6::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 14:25:23 +0000
Received: from CO1NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM3PR12CA0063.outlook.office365.com
 (2603:10b6:0:56::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 25 Jul 2019 14:25:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT014.mail.protection.outlook.com (10.152.80.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 14:25:22 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 25 Jul 2019 09:25:20 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 4/4] drm/amd/display: enable S/G for RAVEN chip
Date: Thu, 25 Jul 2019 10:24:43 -0400
Message-ID: <1564064683-31796-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(305945005)(426003)(316002)(6916009)(4326008)(446003)(11346002)(26005)(336012)(48376002)(14444005)(81156014)(186003)(81166006)(356004)(126002)(50466002)(8676002)(51416003)(476003)(16586007)(86362001)(5660300002)(70586007)(36756003)(70206006)(54906003)(8936002)(47776003)(486006)(2351001)(2906002)(44832011)(6666004)(53416004)(68736007)(7696005)(478600001)(53936002)(2616005)(76176011)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1569; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2610194-120c-45c9-5c57-08d7110bedd1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1569; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1569:
X-Microsoft-Antispam-PRVS: <BN6PR12MB15695BC730A57197FE8D3980EAC10@BN6PR12MB1569.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /Kse4gTc3y3bjfWpe1w1tam1M0xrvlFDX/v7KFJtj682WXwvHHpiBkZFDg9DUhoR1lhOiI+DFVX/GlBASkKOogNf0B6rq4G6t7kNcCpcPnXyhIZWySM3amWHpH8sNuno2Pz+Wfc8Y5mRdPXrNcvsFmHgL79PY6QdxhLs4zkGmVZL2zuXBmWKf9+vDDbK/ShNZFwpKmSR3/ZXOEiKFpZII2SMnRIPXdTQhP/A4ggFlJWRYocIc5R0o+bUZka19JMIDq8nrZL/kfh2zBEB8GrQQf9n0X1RMGgKhlUIqHoYuDagDuspnTL5mfK7LR/8aNZcchnxk6rKnv/03XnpFsLuDdESDjNIR8SOb/3P8jgmxsY0sJB236qUaS9FtjKyCYyQsBZNKa8rY0E+0Ynp1nlqQ4ci3nALGoUHmRcutjoQu+M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 14:25:22.6306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2610194-120c-45c9-5c57-08d7110bedd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1569
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga4IcX+A4QRReMi8CKrSnnLK+c4A5HX+VMZaAk2rbIs=;
 b=rndgLkifHICkU/J5RyYMmW2MbYmz80KqOyIxfZiI32cPy4msjGjwx0vkIde0e0Fmvmn1Y3f3CsoIMz6U3ppyKvnhdkzv5pgik7YunSaqJkziHxtC4CptJXzqQ5cDzi7MHkBjpKHNOQ6M/GhY75mq6mVQ/Z7kRqRY5TAxfadu33E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, michel@daenzer.net,
 shirish.s@amd.com, hersenxs.wu@amd.com, Alexander.Deucher@amd.com,
 Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KCmVuYWJsZXMgZ3B1X3ZtX3N1cHBv
cnQgaW4gZG0gYW5kIGFkZHMKQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFzIHN1cHBvcnRlZCBkb21h
aW4KCnYyOgpNb3ZlIEJPIHBsYWNlbWVudCBsb2dpYyBpbnRvIGFtZGdwdV9kaXNwbGF5X3N1cHBv
cnRlZF9kb21haW5zCgp2MzoKVXNlIGFtZGdwdV9ib192YWxpZGF0ZV91c3djIGluIGFtZGdwdV9k
aXNwbGF5X3N1cHBvcnRlZF9kb21haW5zLgoKdjQ6CmFtZGdwdV9ib192YWxpZGF0ZV91c3djIG1v
dmVkIHRvIHNlcHBlcmF0ZSBwYXRjaC4KCkNoYW5nZS1JZDogSWYzNDMwMGJlYWE2MGJlMmQzNjE3
MGI3YjViMDk2ZWM2NDQ1MDJiMjAKU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92
c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3Bs
YXkuYyAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXku
YwppbmRleCBjYWM5OTc1Li43MzA0NWEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kaXNwbGF5LmMKQEAgLTUwNSw3ICs1MDUsNyBAQCB1aW50MzJfdCBhbWRncHVfZGlz
cGxheV9zdXBwb3J0ZWRfZG9tYWlucyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkgKiBB
UFVzLiBTbyBmb3JjZSB0aGUgQk8gcGxhY2VtZW50IHRvIFZSQU0gaW4gY2FzZSB0aGlzIGFyY2hp
dGVjdHVyZQogCSAqIHdpbGwgbm90IGFsbG93IFVTV0MgbWFwcGluZ3MuCiAJICovCi0JaWYgKGFk
ZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9S
QVZFTiAmJgorCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9DQVJSSVpPICYmIGFkZXYtPmFz
aWNfdHlwZSA8PSBDSElQX1JBVkVOICYmCiAJICAgIGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSAm
JiBhbWRncHVfYm9fc3VwcG9ydF91c3djKDApICYmCiAJICAgIGFtZGdwdV9kZXZpY2VfYXNpY19o
YXNfZGNfc3VwcG9ydChhZGV2LT5hc2ljX3R5cGUpKQogCQlkb21haW4gfD0gQU1ER1BVX0dFTV9E
T01BSU5fR1RUOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKaW5kZXggNDkyMjU4OS4uZjAzODdjZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNjg2LDcgKzY4Niw3
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJICovCiAJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSAmJgogCSAgICBhZGV2LT5hc2lj
X3R5cGUgPj0gQ0hJUF9DQVJSSVpPICYmCi0JICAgIGFkZXYtPmFzaWNfdHlwZSA8IENISVBfUkFW
RU4pCisJICAgIGFkZXYtPmFzaWNfdHlwZSA8PSBDSElQX1JBVkVOKQogCQlpbml0X2RhdGEuZmxh
Z3MuZ3B1X3ZtX3N1cHBvcnQgPSB0cnVlOwogCiAJaWYgKGFtZGdwdV9kY19mZWF0dXJlX21hc2sg
JiBEQ19GQkNfTUFTSykKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
