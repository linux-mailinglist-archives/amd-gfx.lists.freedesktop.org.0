Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83FA9270D
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F496E185;
	Mon, 19 Aug 2019 14:36:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3006B6E179
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPhHAMXG+SQKtD8dRXf6U/nUIpuCwBUUzc/lz+1wE3TRYNWJ+18KS8k+JAKUTDbDMLdi1bgtN17apovmcCXFYAlULkAbNXieqzHnlHeo+rxHUs/T58mpCrWXWOkDBsEFFbfqGb61+dbHriFbG3s+/fbv7P/6UAWF0yUoQfU950IrjsjYZlKR9k13zA2GlgEYo590IqkfXuMbEwhOp8dyD9IMtcVQb8azACN7smHZVvU4mpRRiufRugymY84RMhxa/lVIK/3nRy5HKG/TJpwUcCfQatvOS4VfzNSDN/D0nROOsWaSN8PRkEWNavN2bxB+wuRZ3by5TR0XLCK6x0Bljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWHjxNeEhgfh7ByUkDmNqofz9ik5NLLfV/Le0/BESC0=;
 b=Yt9q/81vcbnNCxhSToTBnjtxGZTepZjFosy5aHCRDLPuZkep/XzAsGzUgjl6uexT/aj5mjc4STUPY92ohEehBTTp1UHMgWh4489qVHNm4I+X9bx29u3X9MrL8IeZRxeZZuQnKpfYLoDxRFgZW5cGqAksve6pVsypcZzTi06TEsBmEAj+TRc21ERfKWVdPM82goFIqBadoC2hv6ZxGzaQnKi9QuDsdffPpFFJvtzVgqOsMUDa2trIwaEIBJrwpsSRhPWcvtx/osfQcVv0KEhPmv7vngiJlgjVECzxOgn6ssc/uUy7QYpoeB3nc6FHmvwvbvKmHNiW7FevtTAN6OFVug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by BN6PR12MB1522.namprd12.prod.outlook.com (2603:10b6:405:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 14:35:57 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:57 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/36] drm/amd/display: fix odm stream release
Date: Mon, 19 Aug 2019 10:35:02 -0400
Message-ID: <20190819143515.21653-24-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(11346002)(486006)(48376002)(50466002)(2906002)(186003)(26005)(4326008)(356004)(6666004)(70206006)(70586007)(51416003)(7696005)(14444005)(305945005)(53936002)(336012)(47776003)(16586007)(6916009)(36756003)(81156014)(8936002)(8676002)(81166006)(316002)(86362001)(50226002)(478600001)(1076003)(5660300002)(2351001)(426003)(76176011)(476003)(2616005)(126002)(446003)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1522; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aed48352-0ebc-435d-c40c-08d724b28c4c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1522; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1522:
X-Microsoft-Antispam-PRVS: <BN6PR12MB152234956C12E0EB0D7CACC3F9A80@BN6PR12MB1522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KNsUvvv1e6Bbxfqk6X0uf5x3n2+rORpPG9RPrOMUlQfUag8MLNYskJDehD0MsKKEuHxt4OgdFlQKOQC1g4fdosM4aPFlnbogMJ8dQ1wO0bIaSTKwLd5suIeMjZwpiRc99GBlwL3hiWv+bh7Cp0lo3vpLVl3n230vunfYA69PAqb6eDdV09DewsekKFfATeA/tyP098lbiyu4/5wEpb9KwRtYwO33GVnnFNMAXTvQCQd8pUrRoZ61MLiZQHXpgfqNTS6X53Qz8qy/o1oWz8DPA5tOaaPOxFk3GEEo537j2qCJKM9lcKjPxUCNAQysjJXN0LnOtfuy/16vU0HnKtw3ivfFfcwx9S8WnwNwcwZN3PkgqzQ7ZIE7MzzQoN6ZgJgI20bJRsetJa7ms4bmEL6WLiXPXT+QMdkYGyiIl4re1Ss=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:57.1182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aed48352-0ebc-435d-c40c-08d724b28c4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1522
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWHjxNeEhgfh7ByUkDmNqofz9ik5NLLfV/Le0/BESC0=;
 b=ua/oxbdstoHtXTtwOFxzPIUq6rIkW1m0Evc5OSJ1LF69vI/HxIifgBtudu8j3D+AF5gDZRc1Ao/5tDGtJZ5MXGp+4NXs3ytK2Xxo9AE8A4Mt/23eQxbm8Lc7to1uZhbE5yMBHQoRNy1GUKWUn3o8IzgurWs0XP3zFMfT+yp1Pbk=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCk5l
ZWQgdG8gbWVtc2V0IGFsbCBvZG0gcGlwZXMgd2hlbiBjYWxsaW5nIGRjX3JlbW92ZV9zdHJlYW1f
ZnJvbV9jdHgKClNpZ25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5
dXNoa2luQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBh
bWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5j
IHwgNjUgKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMo
KyksIDMzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19yZXNvdXJjZS5jCmluZGV4IDk1M2JhNGQwMmExZS4uNmU4OGNiMGZmZmNlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNl
LmMKQEAgLTExMTEsMTMgKzExMTEsMTIgQEAgc3RydWN0IHBpcGVfY3R4ICpyZXNvdXJjZV9nZXRf
aGVhZF9waXBlX2Zvcl9zdHJlYW0oCiAJCXN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSkK
IHsKIAlpbnQgaTsKKwogCWZvciAoaSA9IDA7IGkgPCBNQVhfUElQRVM7IGkrKykgewogCQlpZiAo
cmVzX2N0eC0+cGlwZV9jdHhbaV0uc3RyZWFtID09IHN0cmVhbQogCQkJCSYmICFyZXNfY3R4LT5w
aXBlX2N0eFtpXS50b3BfcGlwZQotCQkJCSYmICFyZXNfY3R4LT5waXBlX2N0eFtpXS5wcmV2X29k
bV9waXBlKSB7CisJCQkJJiYgIXJlc19jdHgtPnBpcGVfY3R4W2ldLnByZXZfb2RtX3BpcGUpCiAJ
CQlyZXR1cm4gJnJlc19jdHgtPnBpcGVfY3R4W2ldOwotCQkJYnJlYWs7Ci0JCX0KIAl9CiAJcmV0
dXJuIE5VTEw7CiB9CkBAIC0xNjk0LDQ1ICsxNjkzLDQ1IEBAIGVudW0gZGNfc3RhdHVzIGRjX3Jl
bW92ZV9zdHJlYW1fZnJvbV9jdHgoCiB7CiAJaW50IGk7CiAJc3RydWN0IGRjX2NvbnRleHQgKmRj
X2N0eCA9IGRjLT5jdHg7Ci0Jc3RydWN0IHBpcGVfY3R4ICpkZWxfcGlwZSA9IE5VTEw7CisJc3Ry
dWN0IHBpcGVfY3R4ICpkZWxfcGlwZSA9IHJlc291cmNlX2dldF9oZWFkX3BpcGVfZm9yX3N0cmVh
bSgmbmV3X2N0eC0+cmVzX2N0eCwgc3RyZWFtKTsKKwlzdHJ1Y3QgcGlwZV9jdHggKm9kbV9waXBl
OwogCi0JLyogUmVsZWFzZSBwcmltYXJ5IHBpcGUgKi8KLQlmb3IgKGkgPSAwOyBpIDwgTUFYX1BJ
UEVTOyBpKyspIHsKLQkJaWYgKG5ld19jdHgtPnJlc19jdHgucGlwZV9jdHhbaV0uc3RyZWFtID09
IHN0cmVhbSAmJgotCQkJCSFuZXdfY3R4LT5yZXNfY3R4LnBpcGVfY3R4W2ldLnRvcF9waXBlKSB7
Ci0JCQlkZWxfcGlwZSA9ICZuZXdfY3R4LT5yZXNfY3R4LnBpcGVfY3R4W2ldOworCWlmICghZGVs
X3BpcGUpIHsKKwkJRENfRVJST1IoIlBpcGUgbm90IGZvdW5kIGZvciBzdHJlYW0gJXAgIVxuIiwg
c3RyZWFtKTsKKwkJcmV0dXJuIERDX0VSUk9SX1VORVhQRUNURUQ7CisJfQogCi0JCQlBU1NFUlQo
ZGVsX3BpcGUtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYyk7Ci0JCQl1cGRhdGVfc3RyZWFtX2VuZ2lu
ZV91c2FnZSgKLQkJCQkJJm5ld19jdHgtPnJlc19jdHgsCi0JCQkJCQlkYy0+cmVzX3Bvb2wsCi0J
CQkJCWRlbF9waXBlLT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMsCi0JCQkJCWZhbHNlKTsKKwlvZG1f
cGlwZSA9IGRlbF9waXBlLT5uZXh0X29kbV9waXBlOwogCi0JCQlpZiAoZGVsX3BpcGUtPnN0cmVh
bV9yZXMuYXVkaW8pCi0JCQkJdXBkYXRlX2F1ZGlvX3VzYWdlKAotCQkJCQkmbmV3X2N0eC0+cmVz
X2N0eCwKLQkJCQkJZGMtPnJlc19wb29sLAotCQkJCQlkZWxfcGlwZS0+c3RyZWFtX3Jlcy5hdWRp
bywKLQkJCQkJZmFsc2UpOworCS8qIFJlbGVhc2UgcHJpbWFyeSBwaXBlICovCisJQVNTRVJUKGRl
bF9waXBlLT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMpOworCXVwZGF0ZV9zdHJlYW1fZW5naW5lX3Vz
YWdlKAorCQkJJm5ld19jdHgtPnJlc19jdHgsCisJCQkJZGMtPnJlc19wb29sLAorCQkJZGVsX3Bp
cGUtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYywKKwkJCWZhbHNlKTsKIAotCQkJcmVzb3VyY2VfdW5y
ZWZlcmVuY2VfY2xvY2tfc291cmNlKCZuZXdfY3R4LT5yZXNfY3R4LAotCQkJCQkJCSAgZGMtPnJl
c19wb29sLAotCQkJCQkJCSAgZGVsX3BpcGUtPmNsb2NrX3NvdXJjZSk7CisJaWYgKGRlbF9waXBl
LT5zdHJlYW1fcmVzLmF1ZGlvKQorCQl1cGRhdGVfYXVkaW9fdXNhZ2UoCisJCQkmbmV3X2N0eC0+
cmVzX2N0eCwKKwkJCWRjLT5yZXNfcG9vbCwKKwkJCWRlbF9waXBlLT5zdHJlYW1fcmVzLmF1ZGlv
LAorCQkJZmFsc2UpOwogCi0JCQlpZiAoZGMtPnJlc19wb29sLT5mdW5jcy0+cmVtb3ZlX3N0cmVh
bV9mcm9tX2N0eCkKLQkJCQlkYy0+cmVzX3Bvb2wtPmZ1bmNzLT5yZW1vdmVfc3RyZWFtX2Zyb21f
Y3R4KGRjLCBuZXdfY3R4LCBzdHJlYW0pOworCXJlc291cmNlX3VucmVmZXJlbmNlX2Nsb2NrX3Nv
dXJjZSgmbmV3X2N0eC0+cmVzX2N0eCwKKwkJCQkJICBkYy0+cmVzX3Bvb2wsCisJCQkJCSAgZGVs
X3BpcGUtPmNsb2NrX3NvdXJjZSk7CiAKLQkJCW1lbXNldChkZWxfcGlwZSwgMCwgc2l6ZW9mKCpk
ZWxfcGlwZSkpOworCWlmIChkYy0+cmVzX3Bvb2wtPmZ1bmNzLT5yZW1vdmVfc3RyZWFtX2Zyb21f
Y3R4KQorCQlkYy0+cmVzX3Bvb2wtPmZ1bmNzLT5yZW1vdmVfc3RyZWFtX2Zyb21fY3R4KGRjLCBu
ZXdfY3R4LCBzdHJlYW0pOwogCi0JCQlicmVhazsKLQkJfQotCX0KKwl3aGlsZSAob2RtX3BpcGUp
IHsKKwkJc3RydWN0IHBpcGVfY3R4ICpuZXh0X29kbV9waXBlID0gb2RtX3BpcGUtPm5leHRfb2Rt
X3BpcGU7CiAKLQlpZiAoIWRlbF9waXBlKSB7Ci0JCURDX0VSUk9SKCJQaXBlIG5vdCBmb3VuZCBm
b3Igc3RyZWFtICVwICFcbiIsIHN0cmVhbSk7Ci0JCXJldHVybiBEQ19FUlJPUl9VTkVYUEVDVEVE
OworCQltZW1zZXQob2RtX3BpcGUsIDAsIHNpemVvZigqb2RtX3BpcGUpKTsKKwkJb2RtX3BpcGUg
PSBuZXh0X29kbV9waXBlOwogCX0KKwltZW1zZXQoZGVsX3BpcGUsIDAsIHNpemVvZigqZGVsX3Bp
cGUpKTsKIAogCWZvciAoaSA9IDA7IGkgPCBuZXdfY3R4LT5zdHJlYW1fY291bnQ7IGkrKykKIAkJ
aWYgKG5ld19jdHgtPnN0cmVhbXNbaV0gPT0gc3RyZWFtKQotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
