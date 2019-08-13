Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868298BFF0
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 19:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197106E216;
	Tue, 13 Aug 2019 17:50:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680040.outbound.protection.outlook.com [40.107.68.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF9F6E216
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 17:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoAZ4h8n7kKLJPJgnPJn/GRpxWMTpNmXeIYAUXM+K8bwCSrBNrM0LP1lQopBiOA7cGmWZZIJJijw2iXHipJSyij54C8YS0xjvStdJtQjRF73UShUKXwmOu6mV3rEbyyf+rIJs6G9JqBSUEkHpjdh6suvd6LN6hOpez1BO39o7JQVHKWi9SGetMtx6MZbjneEpytd+QqKx0ox4SeV7LNtAClSuly3MAM4ezjuoUlXAKUMUN6tG4X1JKdpQlA6nxo7k28rsSWk0+w/DKtUYbcwS994LP5jWKkqe3xr3oYnnUSTKNvFif+D0o/scbRUXeVNobSLJq9L9czcxCtXfpjxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGWdSeDtPrl8FLtjCRLtagkLFujnimU2bMaiwJ/MNPE=;
 b=MOxhl4NvQ4/s2Fu4/ibLRnZlNOYblkgpgI/vTlpWAo23wDUzDiByHONTheApKD8rC/y9XFiZbCUkitZK5VvEemVU+0SaNcxMU2E7tgId81u+VvxifM3r3oQx5+CpiDxu/THwmcaHfJwH7rsacGRlOAOl7+adtQVvpx+DfOxt9mFln2/OpahVgiJr7f9FLQP4ftwHuyF0B+/ttTq0p/zb91hkALqoEaibwC/2E7rQJfhAb+va49wvgUxtxxtGotEzonw1hZlQYVuskANFlNMD50yHGTq0fUgDkNbT0L2LPcceEK5JtWocRfWBn6P6WCjBdtzjx0uqT088Fr2AeNpfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0048.namprd12.prod.outlook.com (2603:10b6:903:129::34)
 by CY4PR12MB1271.namprd12.prod.outlook.com (2603:10b6:903:3d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.23; Tue, 13 Aug
 2019 17:50:53 +0000
Received: from BY2NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by CY4PR12CA0048.outlook.office365.com
 (2603:10b6:903:129::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Tue, 13 Aug 2019 17:50:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT038.mail.protection.outlook.com (10.152.84.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Tue, 13 Aug 2019 17:50:52 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 13 Aug 2019 12:50:49 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Fix null ptr when calling
 query_ras_error_count
Date: Tue, 13 Aug 2019 13:50:41 -0400
Message-ID: <1565718642-18107-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(2906002)(70586007)(356004)(8676002)(6666004)(186003)(26005)(7696005)(51416003)(305945005)(2351001)(53416004)(478600001)(50466002)(70206006)(126002)(486006)(426003)(44832011)(53936002)(47776003)(2616005)(476003)(48376002)(86362001)(4326008)(6916009)(336012)(54906003)(36756003)(316002)(16586007)(81156014)(81166006)(5660300002)(8936002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1271; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29abe577-8ba9-43df-10ea-08d72016c8ad
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1271; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1271:
X-Microsoft-Antispam-PRVS: <CY4PR12MB127157D99F2727236B0E51BBEAD20@CY4PR12MB1271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-Forefront-PRVS: 01283822F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LVIYGumJavgnTmpVg/c7hjS/XGquRCebg9nkBUqTIYelktDBfmAUDDZHxKwXS3QEL/TBbZMDB+VeiYu0yVa9kwRhiFJ3sNKSgA7gTZlC1qCYmONjzl9xD9OwEiNfp13mk+Rk58bFqrSuGj2UpzJz4/kjD6N8bc5FE+89ih7itlYlzY/D6vOTXtFTiU/Fx7jQWIZTJGmC0x0O8GS3KEhzaaMwm4i3LJ774zAOKTIxJtOcrKNuuBm5Vdoe6ZCi48kaZdfb3y10ryqLYVLthzjXu/wnLuBeRRDSKpsf0SBWb/bS9PgW4XNTKIzHhUrogim7mMWgDQCd0AoqVLAjeCSWjkBvNBjvG9q+nql8w2zb8CxpbObjs8LsW0mpYrY9wncH35a/xNuXpWegH3qdCcW5BYs8UdZO/2R03OpfdjqfFZ8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 17:50:52.2547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29abe577-8ba9-43df-10ea-08d72016c8ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGWdSeDtPrl8FLtjCRLtagkLFujnimU2bMaiwJ/MNPE=;
 b=k/vqO7FhnGnE/K5WnSkMU8g86sg9LzVrTtchsZ3JRa5s0yz8saVngw/g7db8RfX/5hnMggvYzYq54NpJ24GkWnQQUHrYtx3UjsS/HeEtabuYmQaRhHnzuS6PgLdlZnbZ4w7h9G3He3yk/FPly+W9PdRKNQEwdRElmPuNAQfHnAk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Xinhui.Pan@amd.com, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmFzX2Vycl9kYXRhLmVycl9hZGRyIHdhcyBuZXZlciBhbGxvY2F0ZWQKClNpZ25lZC1vZmYtYnk6
IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDE3ICsrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwppbmRleCA1MGMxM2IwLi5kOWZiODYwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0xMDExLDYgKzEwMTEsMjEgQEAgc3RhdGljIHZv
aWQgYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfaGFuZGxlcihzdHJ1Y3QgcmFzX21hbmFnZXIgKm9iaikK
IAlpbnQgcmV0OwogCXN0cnVjdCByYXNfZXJyX2RhdGEgZXJyX2RhdGEgPSB7MCwgMCwgMCwgTlVM
TH07CiAKKwkvKiBBbGxvY2F0ZSBlbm91Z2ggdG8gc2VydmUgbWF4ICBudW1iZXIgb2YgcmVxdWVz
dHMqLworCWludCBlcnJfYWRkcl9zaXplID0gZGF0YS0+cmluZ19zaXplIC8gZGF0YS0+YWxpZ25l
ZF9lbGVtZW50X3NpemUgKgorCQkJICAgb2JqLT5hZGV2LT51bWMudW1jX2luc3RfbnVtICoKKwkJ
CSAgIG9iai0+YWRldi0+dW1jLmNoYW5uZWxfaW5zdF9udW07CisKKwllcnJfZGF0YS5lcnJfYWRk
ciA9IGtjYWxsb2MoZXJyX2FkZHJfc2l6ZSwKKwkJCQkgICAgc2l6ZW9mKCplcnJfZGF0YS5lcnJf
YWRkciksCisJCQkJICAgIEdGUF9LRVJORUwpOworCisJaWYgKCFlcnJfZGF0YS5lcnJfYWRkcikg
eworCQlEUk1fRVJST1IoIk5vdCBlbm91Z2ggbWVtb3J5ISIpOworCQlyZXR1cm47CisJfQorCisK
IAl3aGlsZSAoZGF0YS0+cnB0ciAhPSBkYXRhLT53cHRyKSB7CiAJCXJtYigpOwogCQltZW1jcHko
JmVudHJ5LCAmZGF0YS0+cmluZ1tkYXRhLT5ycHRyXSwKQEAgLTEwMzksNiArMTA1NCw4IEBAIHN0
YXRpYyB2b2lkIGFtZGdwdV9yYXNfaW50ZXJydXB0X2hhbmRsZXIoc3RydWN0IHJhc19tYW5hZ2Vy
ICpvYmopCiAJCQl9CiAJCX0KIAl9CisKKwkga2ZyZWUoZXJyX2RhdGEuZXJyX2FkZHIpOwogfQog
CiBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2ludGVycnVwdF9wcm9jZXNzX2hhbmRsZXIoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
