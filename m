Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C7228E79
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Jul 2020 05:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1DC6E317;
	Wed, 22 Jul 2020 03:14:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191A66E317
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Jul 2020 03:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZW9fR56AHCdXrRUWz/6gHEoiLO2wRxdr5C46+hF+ljam1k3+wESYrnRWJbXQmKYyUY0oRdi0TvvMHq+d/MRdpN9G4q/mJNanHt6SbFrqVHFqyxylZQuPWuneQV+A3/e7s04BJJycgWhiJglvgPg0OrYTPE5dUzvJA8ZP37LXO9pLdJWpixB8VCIEXp0E0CpXSJ+GNoYqqVtSlKzsYb75qlh0hael7Ff+GV0L/lYIMh3vVQ1Pu684TuM7+5/w/hpMvvyKtPzzQCy+ImpGQPDZ7CYIjgzc/KATSYVRMSxkF9wofAgA+7rM8SnuYHvf1Ptx41mmcG9AG7Z+6WwIeIUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0cvwiug5Hd1MW5n0Jaq1SicDVofuATKXMO4BCFsxbM=;
 b=ijb8MNah0IhTKm6CCa2cH9D7wtanW257/w0iF4fLATUE0O/nFVpf82AVjSxSWGSv4uPcjRmI0b1DNVfMPgLWYsa7GjtX5ElDFPjghNpplh0wCKefAxQiFPQGvNIxPsJuWHe1eRrRv4UWAJ9D+Uxrco70srOa+wAuGt+eewh64fYpdIeS1iRKXnTUUydgUzpqR78Vony7J/QvD2g04DjrFmL1Z5FlhbLshQ27haMZNp02EjgkrrkMvIuBWC5IO/5btpJM1kKquLnt07BaIU/ySn0j4XtBNW4ts8Fb/iLZE2sfnMNVgs2u/bAiLlorJmVuSiHSgjY5Z5aEzVqC4bWWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0cvwiug5Hd1MW5n0Jaq1SicDVofuATKXMO4BCFsxbM=;
 b=l/mzh14/ZpKtD1LiiV8KslevMLkCn/yyKdJ8AsvPzXsdJREvCKT+DKGRadB78gn/SBU/7eaOJIOtD9QszVFdZs88DEQRAACNZNkpwOSPqK0nI3sT6cDhIYL4YabbU5aeMCFx84TpGfzQkoXWFON/KX+Hjia8EQD3tlb+MYe/fxg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1909.namprd12.prod.outlook.com (2603:10b6:903:124::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 22 Jul
 2020 03:14:50 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::e0b1:48e7:bcbc:351c]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::e0b1:48e7:bcbc:351c%11]) with mapi id 15.20.3195.025; Wed, 22 Jul
 2020 03:14:50 +0000
From: Guchun Chen <guchun.chen@amd.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Hawking.Zhang@amd.com, Dennis.Li@amd.com, Stanley.Yang@amd.com,
 Tao.Zhou1@amd.com, John.Clements@amd.com
Subject: [PATCH 3/5] drm/amdgpu: conduct bad gpu check during bootup/reset
Date: Wed, 22 Jul 2020 11:14:13 +0800
Message-Id: <20200722031415.4792-4-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722031415.4792-1-guchun.chen@amd.com>
References: <20200722031415.4792-1-guchun.chen@amd.com>
X-ClientProxiedBy: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To CY4PR12MB1287.namprd12.prod.outlook.com
 (2603:10b6:903:40::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from guchchen-System-Product-Name.amd.com (58.247.170.242) by
 HK0PR03CA0106.apcprd03.prod.outlook.com (2603:1096:203:b0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20 via Frontend Transport; Wed, 22 Jul 2020 03:14:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a074b1df-d8fd-40d1-6ebe-08d82ded6568
X-MS-TrafficTypeDiagnostic: CY4PR12MB1909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB1909AC0CF136494F2905A473F1790@CY4PR12MB1909.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2ppIffmjwfCUsWhPSgpKX2zVENPQNAV48QdXvGloSA7t4cWCwH9VxmNFUkCCtxIICuofAVGTQtVmIEooyeP37qOnVJwyLgSvEVo7l1i1fiUvsLogEbSamlORl+fa6WFLb7WwKeRtQS1fUp024zlAaAqw5x5Zf9XXc/JDKHGtpxCRXVJelQ4TuY9CJfFb2B43kDGKt7gH1EEea1LPgSiTzH9xKOrPJ79cRT1VfM4kFJUYjJHnTDUXwuK4S5RhrhgOaBJcyLNKK4pmu4QD9NeKkWwnkR4wqZoYD01QEy3LzvH9XZJaEOGLX/vXCOAiGvaeMh71nLcnT+BnOQ/8xM76Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(36756003)(1076003)(52116002)(7696005)(2906002)(66946007)(8936002)(8676002)(6636002)(66556008)(66476007)(5660300002)(26005)(6666004)(6486002)(83380400001)(44832011)(2616005)(86362001)(956004)(30864003)(186003)(498600001)(16526019)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: o+LkQ+N17e1GzmlFW+wuiQfxIWzfUo0o7lx6oYHIcEJW166NrRE/b6IYkNG6m0kUPXyaNKw8cAVV+bVMH41hG5ydRBJD/THbuGHMb8min5RVxBx3uUCd2u6hdDo1NIz8WosPin39GNCNscXvp7bNOXoyNzCIzlarUBnQSQqofYYz1S6ZH7/HUayjvIx/fF0t5dMwMJfl46nXfj4EFnlsPycmp2r68rVoJdfsN6qA5dgRgqRypYKQFwvW/4XFq8qqCFbWxekt74V3nhZTvNRci2XzVZhrxoDk0RfmM4iqpTytq8AKjAA3khUwU1wlJu6xcHkMMyfurb4TcmNBXID8DVBv4zqcSBIGCZJ+tVIqOHSKO7LXvfDdegY5IPpIurKbdu8bLBRS/h9Q+7bbpJBfJ3gyQo/+7viGtuffIkEm7jjjn6fK1LalNqhDXpi+zTAUDKM00F3neZBx3fFwjEQkN5/mHvjsQh9uetp6iRQaopI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a074b1df-d8fd-40d1-6ebe-08d82ded6568
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 03:14:50.7346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A435XMjGGza04mB8CLIqvPiigUShZxKfXfDkriIXqmlc8QnfyJyoknoynp+QCFbO6g0v445jDjCSGW1K8pO+BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1909
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHVyaW5nIGJvb3QgdXAsIHdoZW4gaW5pdCBlZXByb20sIFJBUyB3aWxsIGNoZWNrIGlmIHRoZSBC
QUQKR1BVIHRhZyBpcyBzYXZlZCBvciBub3QuIEFuZCB3aWxsIGJyZWFrIGJvb3QgdXAgYW5kIG5v
dGlmeSB1c2VyCnRvIFJNQSBpdC4KCkF0IHRoZSBtZWFud2hpbGUsIHdoZW4gc2F2ZWQgYmFkIHBh
Z2UgY291bnQgdG8gZWVwcm9tIGV4Y2VlZHMKdGhyZXNob2xkLCBvbmUgcmFzIHJlY292ZXJ5IHdp
bGwgYmUgdHJpZ2dlcmVkIGltbWVkaWF0ZWx5LCBhbmQKYmFkIGdwdSBjaGVjayB3aWxsIGJlIGV4
ZWN1dGVkIGFuZCByZXNldCB3aWxsIGZhaWwgYXMgd2VsbCB0bwpyZW1pbmQgdXNlci4KClVzZXIg
Y291bGQgc2V0IGJhZF9wYWdlX3RocmVzaG9sZCA9IDAgYXMgbW9kdWxlIHBhcmFtZXRlciB3aGVu
CnByb2JpbmcgZHJpdmVyIHRvIGRpc2FibGUgdGhlIGJhZCBmZWF0dXJlIGNoZWNrLgoKU2lnbmVk
LW9mZi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgIHwgMjEgKysrKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyAgICAgICB8IDI1ICsrKysrLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oICAgICAgIHwgMTYgKysrLQogLi4uL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jICAgIHwgODcgKysrKysrKysrKysr
KysrKysrLQogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5oICAgIHwg
IDYgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTQyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCAyNjYy
Y2Q3Yzg2ODUuLmQ1MjliZjc5MTdmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYwpAQCAtMjA2NSw3ICsyMDY1LDkgQEAgc3RhdGljIGludCBhbWRncHVfZGV2
aWNlX2lwX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJICogTm90ZTogdGhlb3Jl
dGljYWxseSwgdGhpcyBzaG91bGQgYmUgY2FsbGVkIGJlZm9yZSBhbGwgdnJhbSBhbGxvY2F0aW9u
cwogCSAqIHRvIHByb3RlY3QgcmV0aXJlZCBwYWdlIGZyb20gYWJ1c2luZwogCSAqLwotCWFtZGdw
dV9yYXNfcmVjb3ZlcnlfaW5pdChhZGV2KTsKKwlyID0gYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0
KGFkZXYpOworCWlmIChyKQorCQlnb3RvIGluaXRfZmFpbGVkOwogCiAJaWYgKGFkZXYtPmdtYy54
Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+IDEpCiAJCWFtZGdwdV94Z21pX2FkZF9kZXZpY2UoYWRl
dik7CkBAIC00MTMzLDggKzQxMzUsMjAgQEAgc3RhdGljIGludCBhbWRncHVfZG9fYXNpY19yZXNl
dChzdHJ1Y3QgYW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSwKIAogCQkJCWFtZGdwdV9mYmRldl9zZXRf
c3VzcGVuZCh0bXBfYWRldiwgMCk7CiAKLQkJCQkvKiBtdXN0IHN1Y2NlZWQuICovCi0JCQkJYW1k
Z3B1X3Jhc19yZXN1bWUodG1wX2FkZXYpOworCQkJCS8qCisJCQkJICogVGhlIENQVSBpcyBCQUQg
b25jZSBmYXVsdHkgcGFnZXMgYnkgRUNDIGhhcworCQkJCSAqIHJlYWNoZWQgdGhlIHRocmVzaG9s
ZCwgYW5kIHJhcyByZWNvdmVyeSBpcworCQkJCSAqIHNjaGVkdWxlZC4gU28gYWRkIG9uZSBjaGVj
ayBoZXJlIHRvIHByZXZlbnQKKwkJCQkgKiByZWNvdmVyeSBpZiBpdCdzIG9uZSBCQUQgR1BVLCBh
bmQgcmVtaW5kCisJCQkJICogdXNlciB0byBSTUEgdGhpcyBHUFUuCisJCQkJICovCisJCQkJaWYg
KCFhbWRncHVfcmFzX2NoZWNrX2JhZF9ncHUodG1wX2FkZXYpKSB7CisJCQkJCS8qIG11c3Qgc3Vj
Y2VlZC4gKi8KKwkJCQkJYW1kZ3B1X3Jhc19yZXN1bWUodG1wX2FkZXYpOworCQkJCX0gZWxzZSB7
CisJCQkJCXIgPSAtRUlOVkFMOworCQkJCQlnb3RvIG91dDsKKwkJCQl9CiAKIAkJCQkvKiBVcGRh
dGUgUFNQIEZXIHRvcG9sb2d5IGFmdGVyIHJlc2V0ICovCiAJCQkJaWYgKGhpdmUgJiYgdG1wX2Fk
ZXYtPmdtYy54Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+IDEpCkBAIC00MTQyLDcgKzQxNTYsNiBA
QCBzdGF0aWMgaW50IGFtZGdwdV9kb19hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfaGl2ZV9pbmZv
ICpoaXZlLAogCQkJfQogCQl9CiAKLQogb3V0OgogCQlpZiAoIXIpIHsKIAkJCWFtZGdwdV9pcnFf
Z3B1X3Jlc2V0X3Jlc3VtZV9oZWxwZXIodG1wX2FkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jCmluZGV4IGUzZDY3ZDg1YzU1Zi4uODE4ZDQxNTRlNGEzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC02Miw4ICs2Miw2IEBAIGNvbnN0
IGNoYXIgKnJhc19ibG9ja19zdHJpbmdbXSA9IHsKICNkZWZpbmUgcmFzX2Vycl9zdHIoaSkgKHJh
c19lcnJvcl9zdHJpbmdbZmZzKGkpXSkKICNkZWZpbmUgcmFzX2Jsb2NrX3N0cihpKSAocmFzX2Js
b2NrX3N0cmluZ1tpXSkKIAotI2RlZmluZSBBTURHUFVfUkFTX0ZMQUdfSU5JVF9CWV9WQklPUwkJ
MQotI2RlZmluZSBBTURHUFVfUkFTX0ZMQUdfSU5JVF9ORUVEX1JFU0VUCQkyCiAjZGVmaW5lIFJB
U19ERUZBVUxUX0ZMQUdTIChBTURHUFVfUkFTX0ZMQUdfSU5JVF9CWV9WQklPUykKIAogLyogaW5q
ZWN0IGFkZHJlc3MgaXMgNTIgYml0cyAqLwpAQCAtMTgxNyw2ICsxODE1LDcgQEAgaW50IGFtZGdw
dV9yYXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlzdHJ1Y3Qg
YW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsKIAlzdHJ1Y3Qg
cmFzX2Vycl9oYW5kbGVyX2RhdGEgKipkYXRhOwogCXVpbnQzMl90IG1heF9lZXByb21fcmVjb3Jk
c19sZW4gPSAwOworCWJvb2wgYmFkX2dwdSA9IGZhbHNlOwogCWludCByZXQ7CiAKIAlpZiAoY29u
KQpAQCAtMTgzOCw5ICsxODM3LDE0IEBAIGludCBhbWRncHVfcmFzX3JlY292ZXJ5X2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJbWF4X2VlcHJvbV9yZWNvcmRzX2xlbiA9IGFtZGdw
dV9yYXNfZWVwcm9tX2dldF9yZWNvcmRfbWF4X2xlbmd0aCgpOwogCWFtZGdwdV9yYXNfdmFsaWRh
dGVfdGhyZXNob2xkKGFkZXYsIG1heF9lZXByb21fcmVjb3Jkc19sZW4pOwogCi0JcmV0ID0gYW1k
Z3B1X3Jhc19lZXByb21faW5pdCgmY29uLT5lZXByb21fY29udHJvbCk7Ci0JaWYgKHJldCkKKwly
ZXQgPSBhbWRncHVfcmFzX2VlcHJvbV9pbml0KCZjb24tPmVlcHJvbV9jb250cm9sLCAmYmFkX2dw
dSk7CisJLyoKKwkgKiB3ZSBvbmx5IGZhaWwgdGhpcyBjYWxsaW5nIGFuZCBoYWx0IGJvb3Rpbmcg
d2hlbiBiYWRfZ3B1IGlzIHRydWUuCisJICovCisJaWYgKGJhZF9ncHUpIHsKKwkJcmV0ID0gLUVJ
TlZBTDsKIAkJZ290byBmcmVlOworCX0KIAogCWlmIChjb24tPmVlcHJvbV9jb250cm9sLm51bV9y
ZWNzKSB7CiAJCXJldCA9IGFtZGdwdV9yYXNfbG9hZF9iYWRfcGFnZXMoYWRldik7CkBAIC0yMTg5
LDMgKzIxOTMsMTYgQEAgYm9vbCBhbWRncHVfcmFzX25lZWRfZW1lcmdlbmN5X3Jlc3RhcnQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlyZXR1cm4gZmFsc2U7CiB9CisKK2Jvb2wgYW1k
Z3B1X3Jhc19jaGVja19iYWRfZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXN0
cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOworCWJv
b2wgYmFkX2dwdSA9IGZhbHNlOworCisJaWYgKGNvbiAmJiAoY29uLT5iYWRfcGFnZV9jbnRfdGhy
ZXNob2xkICE9IDB4RkZGRkZGRkYpKQorCQlhbWRncHVfcmFzX2VlcHJvbV9jaGVja19iYWRfZ3B1
KCZjb24tPmVlcHJvbV9jb250cm9sLAorCQkJCQkJJmJhZF9ncHUpOworCisJLyogV2UgYXJlIG9u
bHkgaW50ZXJlc3RlZCBpbiB2YXJpYWJsZSBiYWRfZ3B1LiAqLworCXJldHVybiBiYWRfZ3B1Owor
fQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCmluZGV4IDQ2NzI2NDlhOTI5
My4uZDdhMzYzYjM3ZmViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
CkBAIC0zMSw2ICszMSwxMCBAQAogI2luY2x1ZGUgInRhX3Jhc19pZi5oIgogI2luY2x1ZGUgImFt
ZGdwdV9yYXNfZWVwcm9tLmgiCiAKKyNkZWZpbmUgQU1ER1BVX1JBU19GTEFHX0lOSVRfQllfVkJJ
T1MJCSgweDEgPDwgMCkKKyNkZWZpbmUgQU1ER1BVX1JBU19GTEFHX0lOSVRfTkVFRF9SRVNFVAkJ
KDB4MSA8PCAxKQorI2RlZmluZSBBTURHUFVfUkFTX0ZMQUdfU0tJUF9CQURfUEFHRV9SRVNWCSgw
eDEgPDwgMikKKwogZW51bSBhbWRncHVfcmFzX2Jsb2NrIHsKIAlBTURHUFVfUkFTX0JMT0NLX19V
TUMgPSAwLAogCUFNREdQVV9SQVNfQkxPQ0tfX1NETUEsCkBAIC00OTMsNiArNDk3LDggQEAgdm9p
ZCBhbWRncHVfcmFzX3N1c3BlbmQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogdW5zaWdu
ZWQgbG9uZyBhbWRncHVfcmFzX3F1ZXJ5X2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAogCQlib29sIGlzX2NlKTsKIAorYm9vbCBhbWRncHVfcmFzX2NoZWNrX2JhZF9ncHUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworCiAvKiBlcnJvciBoYW5kbGluZyBmdW5jdGlv
bnMgKi8KIGludCBhbWRncHVfcmFzX2FkZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAJCXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpicHMsIGludCBwYWdlcyk7CkBA
IC01MDMsMTAgKzUwOSwxNCBAQCBzdGF0aWMgaW5saW5lIGludCBhbWRncHVfcmFzX3Jlc2V0X2dw
dShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlzdHJ1Y3QgYW1kZ3B1X3JhcyAqcmFz
ID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsKIAotCS8qIHNhdmUgYmFkIHBhZ2UgdG8g
ZWVwcm9tIGJlZm9yZSBncHUgcmVzZXQsCi0JICogaTJjIG1heSBiZSB1bnN0YWJsZSBpbiBncHUg
cmVzZXQKKwkvKgorCSAqIFNhdmUgYmFkIHBhZ2UgdG8gZWVwcm9tIGJlZm9yZSBncHUgcmVzZXQs
IGkyYyBtYXkgYmUgdW5zdGFibGUKKwkgKiBpbiBncHUgcmVzZXQuCisJICoKKwkgKiBBbHNvLCBl
eGNsdWRlIHRoZSBjYXNlIHdoZW4gcmFzIHJlY292ZXJ5IGlzc3VlciBpcworCSAqIGVlcnByb20g
cGFnZSB3cml0ZS4KIAkgKi8KLQlpZiAoaW5fdGFzaygpKQorCWlmICghKHJhcy0+ZmxhZ3MgJiBB
TURHUFVfUkFTX0ZMQUdfU0tJUF9CQURfUEFHRV9SRVNWKSAmJiBpbl90YXNrKCkpCiAJCWFtZGdw
dV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoYWRldik7CiAKIAlpZiAoYXRvbWljX2NtcHhjaGcoJnJh
cy0+aW5fcmVjb3ZlcnksIDAsIDEpID09IDApCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhc19lZXByb20uYwppbmRleCBhMmM5ODJiMWVhYzYuLjk2YjYzYzAyNmJhZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jCkBA
IC00Niw2ICs0Niw5IEBACiAjZGVmaW5lIEVFUFJPTV9UQUJMRV9IRFJfVkFMIDB4NDE0ZDQ0NTIK
ICNkZWZpbmUgRUVQUk9NX1RBQkxFX1ZFUiAweDAwMDEwMDAwCiAKKy8qIEJhZCBHUFUgdGFnIOKA
mEJBREfigJkgKi8KKyNkZWZpbmUgRUVQUk9NX1RBQkxFX0hEUl9CQUQgMHg0MjQxNDQ0NworCiAv
KiBBc3N1bWUgMiBNYml0IHNpemUgKi8KICNkZWZpbmUgRUVQUk9NX1NJWkVfQllURVMgMjU2MDAw
CiAjZGVmaW5lIEVFUFJPTV9QQUdFX19TSVpFX0JZVEVTIDI1NgpAQCAtMjM4LDEyICsyNDEsMTQg
QEAgaW50IGFtZGdwdV9yYXNfZWVwcm9tX3Jlc2V0X3RhYmxlKHN0cnVjdCBhbWRncHVfcmFzX2Vl
cHJvbV9jb250cm9sICpjb250cm9sKQogCiB9CiAKLWludCBhbWRncHVfcmFzX2VlcHJvbV9pbml0
KHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sKQoraW50IGFtZGdwdV9y
YXNfZWVwcm9tX2luaXQoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2ws
CisJCQlib29sICpiYWRfZ3B1KQogewogCWludCByZXQgPSAwOwogCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gdG9fYW1kZ3B1X2RldmljZShjb250cm9sKTsKIAl1bnNpZ25lZCBjaGFyIGJ1
ZmZbRUVQUk9NX0FERFJFU1NfU0laRSArIEVFUFJPTV9UQUJMRV9IRUFERVJfU0laRV0gPSB7IDAg
fTsKIAlzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fdGFibGVfaGVhZGVyICpoZHIgPSAmY29udHJv
bC0+dGJsX2hkcjsKKwlzdHJ1Y3QgYW1kZ3B1X3JhcyAqcmFzID0gYW1kZ3B1X3Jhc19nZXRfY29u
dGV4dChhZGV2KTsKIAlzdHJ1Y3QgaTJjX21zZyBtc2cgPSB7CiAJCQkuYWRkcgk9IDAsCiAJCQku
ZmxhZ3MJPSBJMkNfTV9SRCwKQEAgLTI1MSw2ICsyNTYsOCBAQCBpbnQgYW1kZ3B1X3Jhc19lZXBy
b21faW5pdChzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCkKIAkJCS5i
dWYJPSBidWZmLAogCX07CiAKKwkqYmFkX2dwdSA9IGZhbHNlOworCiAJLyogVmVyaWZ5IGkyYyBh
ZGFwdGVyIGlzIGluaXRpYWxpemVkICovCiAJaWYgKCFhZGV2LT5wbS5zbXVfaTJjLmFsZ28pCiAJ
CXJldHVybiAtRU5PRU5UOwpAQCAtMjc5LDYgKzI4NiwxMSBAQCBpbnQgYW1kZ3B1X3Jhc19lZXBy
b21faW5pdChzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCkKIAkJRFJN
X0RFQlVHX0RSSVZFUigiRm91bmQgZXhpc3RpbmcgRUVQUk9NIHRhYmxlIHdpdGggJWQgcmVjb3Jk
cyIsCiAJCQkJIGNvbnRyb2wtPm51bV9yZWNzKTsKIAorCX0gZWxzZSBpZiAoKHJhcy0+YmFkX3Bh
Z2VfY250X3RocmVzaG9sZCAhPSAweEZGRkZGRkZGKSAmJiAoCisJCQloZHItPmhlYWRlciA9PSBF
RVBST01fVEFCTEVfSERSX0JBRCkpIHsKKwkJKmJhZF9ncHUgPSB0cnVlOworCQlEUk1fRVJST1Io
IkRldGVjdCBCQUQgR1BVIFRBRyBpbiBlZXByb20gdGFibGUgYW5kICIKKwkJCQkiR1BVIHNoYWxs
IGJlIFJNQWVkLlxuIik7CiAJfSBlbHNlIHsKIAkJRFJNX0lORk8oIkNyZWF0aW5nIG5ldyBFRVBS
T00gdGFibGUiKTsKIApAQCAtMzc1LDYgKzM4Nyw0NCBAQCBzdGF0aWMgdWludDMyX3QgX19jb3Jy
ZWN0X2VlcHJvbV9kZXN0X2FkZHJlc3ModWludDMyX3QgY3Vycl9hZGRyZXNzKQogCXJldHVybiBj
dXJyX2FkZHJlc3M7CiB9CiAKK2ludCBhbWRncHVfcmFzX2VlcHJvbV9jaGVja19iYWRfZ3B1KHN0
cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sLAorCQkJCQlib29sICpiYWRf
Z3B1KQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gdG9fYW1kZ3B1X2RldmljZShj
b250cm9sKTsKKwl1bnNpZ25lZCBjaGFyIGJ1ZmZbRUVQUk9NX0FERFJFU1NfU0laRSArCisJCQlF
RVBST01fVEFCTEVfSEVBREVSX1NJWkVdID0geyAwIH07CisJc3RydWN0IGFtZGdwdV9yYXNfZWVw
cm9tX3RhYmxlX2hlYWRlciAqaGRyID0gJmNvbnRyb2wtPnRibF9oZHI7CisJc3RydWN0IGkyY19t
c2cgbXNnID0geworCQkJLmFkZHIgPSBjb250cm9sLT5pMmNfYWRkcmVzcywKKwkJCS5mbGFncyA9
IEkyQ19NX1JELAorCQkJLmxlbiA9IEVFUFJPTV9BRERSRVNTX1NJWkUgKyBFRVBST01fVEFCTEVf
SEVBREVSX1NJWkUsCisJCQkuYnVmID0gYnVmZiwKKwl9OworCWludCByZXQ7CisKKwkqYmFkX2dw
dSA9IGZhbHNlOworCisJLyogcmVhZCBFRVBST00gdGFibGUgaGVhZGVyICovCisJbXV0ZXhfbG9j
aygmY29udHJvbC0+dGJsX211dGV4KTsKKwlyZXQgPSBpMmNfdHJhbnNmZXIoJmFkZXYtPnBtLnNt
dV9pMmMsICZtc2csIDEpOworCWlmIChyZXQgPCAxKSB7CisJCWRldl9lcnIoYWRldi0+ZGV2LCAi
RmFpbGVkIHRvIHJlYWQgRUVQUk9NIHRhYmxlIGhlYWRlci5cbiIpOworCWdvdG8gZXJyOworCX0K
KworCV9fZGVjb2RlX3RhYmxlX2hlYWRlcl9mcm9tX2J1ZmYoaGRyLCAmYnVmZlsyXSk7CisKKwlp
ZiAoaGRyLT5oZWFkZXIgPT0gRUVQUk9NX1RBQkxFX0hEUl9CQUQpIHsKKwkJZGV2X3dhcm4oYWRl
di0+ZGV2LCAiQ3VycmVudCBHUFUgaXMgQkFEIGFuZCBzaG91bGQgYmUgUk1BZWQuXG4iKTsKKwkJ
KmJhZF9ncHUgPSB0cnVlOworCX0KKworCXJldCA9IDA7CitlcnI6CisJbXV0ZXhfdW5sb2NrKCZj
b250cm9sLT50YmxfbXV0ZXgpOworCXJldHVybiByZXQ7Cit9CisKIGludCBhbWRncHVfcmFzX2Vl
cHJvbV9wcm9jZXNzX3JlY29kcyhzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29u
dHJvbCwKIAkJCQkJICAgIHN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmRzLAogCQkJ
CQkgICAgYm9vbCB3cml0ZSwKQEAgLTM4Myw4ICs0MzMsMTAgQEAgaW50IGFtZGdwdV9yYXNfZWVw
cm9tX3Byb2Nlc3NfcmVjb2RzKHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250
cm9sLAogCWludCBpLCByZXQgPSAwOwogCXN0cnVjdCBpMmNfbXNnICptc2dzLCAqbXNnOwogCXVu
c2lnbmVkIGNoYXIgKmJ1ZmZzLCAqYnVmZjsKKwlib29sIHNjaGVkX3Jhc19yZWNvdmVyeSA9IGZh
bHNlOwogCXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmQ7CiAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOworCXN0cnVjdCBhbWRn
cHVfcmFzICpyYXMgPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOwogCiAJaWYgKGFkZXYt
PmFzaWNfdHlwZSAhPSBDSElQX1ZFR0EyMCAmJiBhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNU
VVJVUykKIAkJcmV0dXJuIDA7CkBAIC00MDIsNiArNDU0LDI1IEBAIGludCBhbWRncHVfcmFzX2Vl
cHJvbV9wcm9jZXNzX3JlY29kcyhzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29u
dHJvbCwKIAkJZ290byBmcmVlX2J1ZmY7CiAJfQogCisJLyoKKwkgKiBJZiBzYXZlZCBiYWQgcGFn
ZXMgbnVtYmVyIGV4Y2VlZHMgdGhlIGJhZCBwYWdlIHRocmVzaG9kIGZvcgorCSAqIHRoZSB3aG9s
ZSBWUkFNLCB1cGRhdGUgdGFibGUgaGVhZGVyIHRvIG1hcmsgb25lIEJBRCBHUFUgYW5kCisJICog
c2NoZWR1bGUgb25lIHJhcyByZWNvdmVyeSBhZnRlciBlZXByb20gd3JpdGUgaXMgZG9uZSwgdGhp
cworCSAqIGNhbiBhdm9pZCB0aGUgbWlzc2luZyBmb3IgbGF0ZXN0IHJlY29yZHMuCisJICoKKwkg
KiBUaGlzIG5ldyBoZWFkZXIgd2lsbCBiZSBwaWNrZWQgdXAgYW5kIGNoZWNrZWQgaW4gdGhlIGJv
b3R1cCBieQorCSAqIHJhcyByZWNvdmVyeSwgd2hpY2ggbWF5IGJyZWFrIGJvb3R1cCBwcm9jZXNz
IHRvIG5vdGlmeSB1c2VyIHRoaXMKKwkgKiBHUFUgaXMgYmFkIGFuZCB0byBSTUEoUmV0dXJuIE1l
cmNoYW5kaXNlIEF1dGhvcml6YXRpb24pIHRoaXMgR1BVLgorCSAqLworCWlmICh3cml0ZSAmJiAo
cmFzLT5iYWRfcGFnZV9jbnRfdGhyZXNob2xkICE9IDB4RkZGRkZGRkYpICYmCisJCSgoY29udHJv
bC0+bnVtX3JlY3MgKyBudW0pID49IHJhcy0+YmFkX3BhZ2VfY250X3RocmVzaG9sZCkpIHsKKwkJ
ZGV2X3dhcm4oYWRldi0+ZGV2LAorCQkJIlNhdmVkIGJhZCBwYWdlcyglZCkgcmVhY2hlcyB0aHJl
c2hvbGQgdmFsdWUoJWQpLlxuIiwKKwkJCWNvbnRyb2wtPm51bV9yZWNzICsgbnVtLCByYXMtPmJh
ZF9wYWdlX2NudF90aHJlc2hvbGQpOworCQkJY29udHJvbC0+dGJsX2hkci5oZWFkZXIgPSBFRVBS
T01fVEFCTEVfSERSX0JBRDsKKwkJc2NoZWRfcmFzX3JlY292ZXJ5ID0gdHJ1ZTsKKwl9CisKIAkv
KiBJbiBjYXNlIG9mIG92ZXJmbG93IGp1c3Qgc3RhcnQgZnJvbSBiZWdpbm5pbmcgdG8gbm90IGxv
c2UgbmV3ZXN0IHJlY29yZHMgKi8KIAlpZiAod3JpdGUgJiYgKGNvbnRyb2wtPm5leHRfYWRkciAr
IEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRSAqIG51bSA+IEVFUFJPTV9TSVpFX0JZVEVTKSkKIAkJ
Y29udHJvbC0+bmV4dF9hZGRyID0gRUVQUk9NX1JFQ09SRF9TVEFSVDsKQEAgLTQ4Miw2ICs1NTMs
MjAgQEAgaW50IGFtZGdwdV9yYXNfZWVwcm9tX3Byb2Nlc3NfcmVjb2RzKHN0cnVjdCBhbWRncHVf
cmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sLAogCQlfX3VwZGF0ZV90YmxfY2hlY2tzdW0oY29u
dHJvbCwgcmVjb3JkcywgbnVtLCBvbGRfaGRyX2J5dGVfc3VtKTsKIAogCQlfX3VwZGF0ZV90YWJs
ZV9oZWFkZXIoY29udHJvbCwgYnVmZnMpOworCisJCWlmIChzY2hlZF9yYXNfcmVjb3ZlcnkpIHsK
KwkJCS8qCisJCQkgKiBCZWZvcmUgc2NoZWR1bGluZyByYXMgcmVjb3ZlcnksIGFzc2VydCB0aGUg
cmVsYXRlZAorCQkJICogZmxhZyBmaXJzdCwgd2hpY2ggc2hhbGwgYnlwYXNzIGNvbW1vbiBiYWQg
cGFnZQorCQkJICogcmVzZXJ2YXRpb24gZXhlY3V0aW9uIGluIGFtZGdwdV9yYXNfcmVzZXRfZ3B1
LgorCQkJICovCisJCQlhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpLT5mbGFncyB8PQorCQkJ
CUFNREdQVV9SQVNfRkxBR19TS0lQX0JBRF9QQUdFX1JFU1Y7CisKKwkJCWRldl93YXJuKGFkZXYt
PmRldiwgIkNvbmR1Y3QgcmFzIHJlY292ZXJ5IGR1ZSB0byBiYWQgIgorCQkJCQkicGFnZSB0aHJl
c2hvbGQgcmVhY2hlZC5cbiIpOworCQkJYW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldik7CisJCX0K
IAl9IGVsc2UgaWYgKCFfX3ZhbGlkYXRlX3RibF9jaGVja3N1bShjb250cm9sLCByZWNvcmRzLCBu
dW0pKSB7CiAJCURSTV9XQVJOKCJFRVBST00gVGFibGUgY2hlY2tzdW0gbWlzbWF0Y2ghIik7CiAJ
CS8qIFRPRE8gVW5jb21tZW50IHdoZW4gRUVQUk9NIHJlYWQvd3JpdGUgaXMgcmVsbGlhYmxlICov
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJv
bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uaAppbmRl
eCBiMjcyODQwY2IwNjkuLjRjY2QxMzkyNDhhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5oCkBAIC03Nyw5ICs3NywxMyBAQCBzdHJ1Y3QgZWVw
cm9tX3RhYmxlX3JlY29yZCB7CiAJdW5zaWduZWQgY2hhciBtY3VtY19pZDsKIH1fX2F0dHJpYnV0
ZV9fKChfX3BhY2tlZF9fKSk7CiAKLWludCBhbWRncHVfcmFzX2VlcHJvbV9pbml0KHN0cnVjdCBh
bWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sKTsKK2ludCBhbWRncHVfcmFzX2VlcHJv
bV9pbml0KHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sLAorCQkJCWJv
b2wgKmJhZF9ncHUpOwogaW50IGFtZGdwdV9yYXNfZWVwcm9tX3Jlc2V0X3RhYmxlKHN0cnVjdCBh
bWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sKTsKIAoraW50IGFtZGdwdV9yYXNfZWVw
cm9tX2NoZWNrX2JhZF9ncHUoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRy
b2wsCisJCQkJYm9vbCAqYmFkX2dwdSk7CisKIGludCBhbWRncHVfcmFzX2VlcHJvbV9wcm9jZXNz
X3JlY29kcyhzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwKIAkJCQkJ
ICAgIHN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmRzLAogCQkJCQkgICAgYm9vbCB3
cml0ZSwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cg==
