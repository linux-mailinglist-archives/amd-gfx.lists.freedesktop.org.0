Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA588BFF2
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 19:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FF36E217;
	Tue, 13 Aug 2019 17:51:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24ED6E217
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 17:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4HD0lTQ4u/Nl4fJX79PT3BVOfqs+f4ZKu7DBHhwwAlSJuGfOb0TGECz1FtMH5GVpWK9kcp2s8VRk8qMfCipzmFhEXBzjP/9Dac7qp1uMs4XkK04lmm0oImxnnos8j33ugl+Nw/45aKsaYRXowE5fxTUVxlS0LKH0V7QpF3utHSHhhQRyh3UzVj5CPdHy8VDb5tRhwYOlSqpsjdepR5rrnoimRwKL1n8bDOi9jI9hkaxJpoROl8JVf7KMU89FZ4MCgNI062xz2pho++j+0a50wk7ISSse7jNv1Yyqx0dKc6Nd8M24Ytz+cwymQIqRJJgIkaBxTBryhUrGnl/HozR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TImktPiCugLB/nQTrToKda26uPocWIUKO+jP7ANZRxw=;
 b=QBAbmpKO3xO4UjwZD591uCyLVMJYGICFRuosc3wj9I8w0M4azMcqLuex7tenkQ16b88RF7LTgLH06XmYFAennF6adD+sravPuWZBnAlcB1e3Kmi9YW0ixnERhYmseDNegQZLEdv6zfbe+bc/i2Dqp9TxT3/SpFldS/aOPzsLKKVW93gYNlM3FOGFefOIxm73xt4tQOYc02pUnXymwSgnOd+Kj91RQWGz3GbeKXXxk9Sw0dmA9DXiEH9DRdXFXr17o6o+R+N2950XR20XwGOnErCwIv9KrP1eIPwVDAHs0UvLwEiMtc5UR5aca5yxFiybe66a7PFm5gHyb4Uv7w1Ijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0055.namprd12.prod.outlook.com (2603:10b6:0:56::23) by
 DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 13 Aug 2019 17:51:01 +0000
Received: from BY2NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM3PR12CA0055.outlook.office365.com
 (2603:10b6:0:56::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Tue, 13 Aug 2019 17:51:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT014.mail.protection.outlook.com (10.152.84.239) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Tue, 13 Aug 2019 17:51:00 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 13 Aug 2019 12:50:54 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Start using amdgpu_ras_add_bad_pages.
Date: Tue, 13 Aug 2019 13:50:42 -0400
Message-ID: <1565718642-18107-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565718642-18107-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565718642-18107-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(51416003)(14444005)(76176011)(48376002)(36756003)(7696005)(50466002)(81156014)(186003)(81166006)(6666004)(86362001)(356004)(476003)(8936002)(336012)(50226002)(2616005)(426003)(446003)(11346002)(8676002)(6916009)(5660300002)(47776003)(126002)(486006)(26005)(44832011)(54906003)(53936002)(316002)(305945005)(2351001)(478600001)(2906002)(70206006)(4326008)(16586007)(70586007)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d20897f-7f34-484c-553e-08d72016cdcb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127646EA0F38E24FF17206A8EAD20@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 01283822F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qYayEWq3dW73sNNR+XswegSo3vBQEX5gps7T+10cwKvf1+tcjkI43OsTtWOaxzqPPVtzQipjSS0GATtrPnumZbfh9hQ1n8xxHlNbaZOzDEyoz4EAiblPxJRlW5vZvPL+huABD7HG3MiUF9fWBw+fuJVWpH1rzLpYNmj8L2zzLSo3nQdf9MgZzMb4ee9ck6cZqJKv7HVZ1obvKObHHoJOkI/gmbJIBUs32Ve4bkCVxh0A+6nrbLeio8sMBj2Im2F2/KzAspNzFXIXbTSoxbJ9hkW+oeyZ2ijrI41MReIniaeUrV1i47AwCcufrg/hhUA55BMXKNLtuftgSuvjrTsKXefOzVn72Bhd6Y5NdV2thLlcLTylWni6CBj4hqQdmWGjDWIG+sK1va/8JlW8A8f5p/durf+rpB2NvaOGuHaen4o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 17:51:00.8637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d20897f-7f34-484c-553e-08d72016cdcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TImktPiCugLB/nQTrToKda26uPocWIUKO+jP7ANZRxw=;
 b=yKPx8qJZeHBmBuaHV0Dfo7xz4dv0nVsSPFZzzwUGH69chq2i4IiqwJDn+XMMkeB/mSUDI70jbV5x/3biVTAPg/aINateZfUvLYN3C/m7hsu+y7ne1weUjX/aQJb0pLLRdDni2oqJj5RaaTUAZzVBEDVUtwkY8i6Xv32wApQ0I4g=
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

U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDIzICsrKysr
KysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IDI5NmUy
ZDkuLjQ2NTE3YzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtMjQz
LDE1ICsyNDMsMzYgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlzdHJ1Y3QgcmFzX2Vycl9kYXRhICplcnJfZGF0
YSwKIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpCiB7CisJdW5zaWduZWQgbG9uZyBu
ZXdfZXJyX2FkZHJfY250LCBvbGRfZXJyX2FkZHJfY250ID0gZXJyX2RhdGEtPmVycl9hZGRyX2Nu
dDsKKwogCWtnZDJrZmRfc2V0X3NyYW1fZWNjX2ZsYWcoYWRldi0+a2ZkLmRldik7CiAJaWYgKGFk
ZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KQogCQlhZGV2LT51bWMuZnVuY3Mt
PnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCBlcnJfZGF0YSk7CiAJLyogdW1jIHF1ZXJ5X3Jh
c19lcnJvcl9hZGRyZXNzIGlzIGFsc28gcmVzcG9uc2libGUgZm9yIGNsZWFyaW5nCiAJICogZXJy
b3Igc3RhdHVzCiAJICovCi0JaWYgKGFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2Fk
ZHJlc3MpCisJaWYgKGFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MpIHsK
KwkJdW5zaWduZWQgbG9uZyAqYnBzOworCQlpbnQgaTsKKwogCQlhZGV2LT51bWMuZnVuY3MtPnF1
ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKGFkZXYsIGVycl9kYXRhKTsKIAorCQluZXdfZXJyX2FkZHJf
Y250ID0gZXJyX2RhdGEtPmVycl9hZGRyX2NudCAtIG9sZF9lcnJfYWRkcl9jbnQ7CisKKwkJaWYg
KG5ld19lcnJfYWRkcl9jbnQpIHsKKwkJCWJwcyA9IGtjYWxsb2MobmV3X2Vycl9hZGRyX2NudCwg
c2l6ZW9mKCpicHMpLCBHRlBfS0VSTkVMKTsKKwkJCWlmICghYnBzKQorCQkJCXJldHVybiAtRU5P
TUVNOworCisJCQlmb3IgKGkgPSAwOyBpIDwgbmV3X2Vycl9hZGRyX2NudDsgaSsrKQorCQkJCWJw
c1tpXSA9IGVycl9kYXRhLT5lcnJfYWRkcltvbGRfZXJyX2FkZHJfY250ICsgaV0gID4+IFBBR0Vf
U0hJRlQ7CisKKwkJCWFtZGdwdV9yYXNfYWRkX2JhZF9wYWdlcyhhZGV2LCBicHMsIG5ld19lcnJf
YWRkcl9jbnQpOworCisJCQlrZnJlZShicHMpOworCQl9CisJfQorCiAJLyogb25seSB1bmNvcnJl
Y3RhYmxlIGVycm9yIG5lZWRzIGdwdSByZXNldCAqLwogCWlmIChlcnJfZGF0YS0+dWVfY291bnQp
CiAJCWFtZGdwdV9yYXNfcmVzZXRfZ3B1KGFkZXYsIDApOwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
