Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E701E69DBD
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF7889C68;
	Mon, 15 Jul 2019 21:21:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730063.outbound.protection.outlook.com [40.107.73.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA5E89C6C
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEad81J7OMlUPJVm3juTTljlZ87h3KY6c1foVKCwWINAI3Q3gBSgidpZKNrXpZutPjkzNG2cNLwAnuVWRiehAT0HApkYMtnRprLOaqyXiMuFCxT+YXnRPhOAhHAhcu6bGByz5o9p06txrfO1kUvCh4uJBePu1RGq7jhuLYoCXG2dZeaYsKw7Bju7mZW2i/vJJ/TiOJo8wVSjJ3PA/Ym9KhCfqn7xadGF0OmntPS2fCvTyumRFEtAGDagHfk3FSk49Nxp7oTgUh+31GSLGaWf2c0V8ZwZQaShQxO4eKxCNckvbHwievyisOWlmwTdNGx4Nwgngk5ajKD3WZMfdHy2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8hlch3ixsz9FIG21ir+iru1Yksgcps1yanIktL4ox8=;
 b=Bbn+MJAyVEn0WDbD22j3WIcsmolN71AAwDmKzWPI8TvllK0Btq0VDdukDePf150B3mLPCDpzvlRWvS2g6/qRjt5TpJx77HbGyV1fwQNZohWlHhtMiCVWmYRrqpSfOy1zGrbdlgSXKaJ15x/W8wP4Jp2PCFcaaqFccPFTDV4KWlVWb3+O5XWwOCO/NXnoflXx0hmOx027VxB29DBzQStTjadt+Dfqv/I/0Ahy4zt2wxjGKG8F2I73oheBqWnBm7YtHe+xR1ZnQS2LtRZjLUB8TLlwUMis6LtpDtjIdug+nORW+WXCFzu11I6LFQxziQxrLwQr2qIDPrDY1fY4XzBhuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 MWHPR12MB1933.namprd12.prod.outlook.com (2603:10b6:300:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:40 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:39 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:25 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 42/87] drm/amd/display: use encoder's engine id to find
 matched free audio device
Date: Mon, 15 Jul 2019 17:20:04 -0400
Message-ID: <20190715212049.4584-43-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(428003)(189003)(199004)(53936002)(426003)(5660300002)(36756003)(54906003)(4326008)(486006)(336012)(68736007)(186003)(2616005)(476003)(76176011)(49486002)(446003)(316002)(26005)(11346002)(50226002)(126002)(70206006)(70586007)(1076003)(2351001)(2906002)(6666004)(48376002)(50466002)(356004)(51416003)(86362001)(2876002)(47776003)(6916009)(478600001)(305945005)(81166006)(8936002)(81156014)(8676002)(2870700001)(14444005)(20533002)(37363001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1933; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09aeca8f-b9ee-43aa-a3e1-08d7096a6d49
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1933; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1933:
X-Microsoft-Antispam-PRVS: <MWHPR12MB19331C246020C9F38FC10B7282CF0@MWHPR12MB1933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: l1zqYWrymR/+ZZrf3JKKZBp/gL9pHaIWjofNzJePFFuS043tcvG6xjiTDtHcjSISqykv8iZUyozL5YavciTEofIgRj7hJIZqwY4ROOAyRn3zRktEa2uw7ISYqKBsU3L+Z+XNZ5rO3hNSnAR9CwM+J5ydmHBpCcy2+tr9zS8o3JHedmeR6zmnrpbu3w6mjdcKEFc6T7CQt1D47f6WwROMN91uaQnOPfPtIQhQSDRuZBAlgr79pFVnAOLmD0RswUQjgHRomEMe6rW5NN+j1tS3TdyRip5BDTMr1b1agae7xR/zQAAD3TfjnFQwi+5CN1RJUebRIQHcUw6MPImQU13nwPjnlgOURUHpp1s0yD8gsseqgHxfEVY2Fe7n0LEBEft32Q+HOhYiVH2vDctoWCuQ95anawfAzinF4PL2/MFFU5M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:39.9018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09aeca8f-b9ee-43aa-a3e1-08d7096a6d49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8hlch3ixsz9FIG21ir+iru1Yksgcps1yanIktL4ox8=;
 b=zc0M7RGj7eShdlgQ3du3HUeF1/el+KfmsuZ8Fdctn3xEV02WGKyS36JE2cOm54aM0AolQEKJ51Q8fbMftYXt2QZ4tFPazhdqeJ6qRY0dFfWmPD4KQ4WFD8n6oSpS+gfRjZ78U2CDbvmuFLd+Jmv6C+l91OhnQIldElgtnzE1z0I=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Tai Man <taiman.wong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFpIE1hbiA8dGFpbWFuLndvbmdAYW1kLmNvbT4KCltXaHldCk9uIHNvbWUgcGxhdGZv
cm1zLCB0aGUgZW5jb2RlciBpZCAzIGlzIG5vdCBwb3B1bGF0ZWQuIFNvIHRoZSBlbmNvZGVycwph
cmUgbm90IHN0b3JlZCBpbiByaWdodCBvcmRlciBhcyBpbmRleCAoaWQ6IDAsIDEsIDIsIDQsIDUp
IGF0IHBvb2wuIFRoaXMKd291bGQgY2F1c2UgZW5jb2RlcnMgaWQgNCAmIGlkIDUgdG8gZmFpbCB3
aGVuIGZpbmRpbmcgY29ycmVzcG9uZGluZwphdWRpbyBkZXZpY2UsIGRlZmF1bHRpbmcgdG8gdGhl
IGZpcnN0IGF2YWlsYWJsZSBhdWRpbyBkZXZpY2UuIEFzIHJlc3VsdCwKd2UgY2Fubm90IHN0cmVh
bSBhdWRpbyBpbnRvIHR3byBEUCBwb3J0cyB3aXRoIGVuY29kZXJzIGlkIDQgJiBpZCA1LgoKW0hv
d10KSXQgbmVlZCB0byBjcmVhdGUgZW5vdWdoIGF1ZGlvIGRldmljZSBvYmplY3RzICgwIC0gNSkg
dG8gcGVyZm9ybSBtYXRjaGluZy4KVGhlbiB1c2UgZW5jb2RlciBlbmdpbmUgaWQgdG8gZmluZCBt
YXRjaGVkIGF1ZGlvIGRldmljZS4KClNpZ25lZC1vZmYtYnk6IFRhaSBNYW4gV29uZyA8dGFpbWFu
LndvbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFt
ZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIHwgOCArKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jCmluZGV4IDVi
ODUxMzlmYjNjZS4uNWU3YjhiMmRkMTc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKQEAgLTI2NSw3ICsyNjUsNyBAQCBib29sIHJl
c291cmNlX2NvbnN0cnVjdCgKIAkJICogUE9SVF9DT05ORUNUSVZJVFkgPT0gMSAoYXMgaW5zdHJ1
Y3RlZCBieSBIVyB0ZWFtKS4KIAkJICovCiAJCXVwZGF0ZV9udW1fYXVkaW8oJnN0cmFwcywgJm51
bV9hdWRpbywgJnBvb2wtPmF1ZGlvX3N1cHBvcnQpOwotCQlmb3IgKGkgPSAwOyBpIDwgcG9vbC0+
cGlwZV9jb3VudCAmJiBpIDwgbnVtX2F1ZGlvOyBpKyspIHsKKwkJZm9yIChpID0gMDsgaSA8IGNh
cHMtPm51bV9hdWRpbzsgaSsrKSB7CiAJCQlzdHJ1Y3QgYXVkaW8gKmF1ZCA9IGNyZWF0ZV9mdW5j
cy0+Y3JlYXRlX2F1ZGlvKGN0eCwgaSk7CiAKIAkJCWlmIChhdWQgPT0gTlVMTCkgewpAQCAtMTY3
Niw2ICsxNjc2LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgYXVkaW8gKmZpbmRfZmlyc3RfZnJlZV9hdWRp
bygKIAkJCXJldHVybiBwb29sLT5hdWRpb3NbaV07CiAJCX0KIAl9CisKKyAgICAvKiB1c2UgZW5n
aW5lIGlkIHRvIGZpbmQgZnJlZSBhdWRpbyAqLworCWlmICgoaWQgPCBwb29sLT5hdWRpb19jb3Vu
dCkgJiYgKHJlc19jdHgtPmlzX2F1ZGlvX2FjcXVpcmVkW2lkXSA9PSBmYWxzZSkpIHsKKwkJcmV0
dXJuIHBvb2wtPmF1ZGlvc1tpZF07CisJfQorCiAJLypub3QgZm91bmQgdGhlIG1hdGNoaW5nIG9u
ZSwgZmlyc3QgY29tZSBmaXJzdCBzZXJ2ZSovCiAJZm9yIChpID0gMDsgaSA8IHBvb2wtPmF1ZGlv
X2NvdW50OyBpKyspIHsKIAkJaWYgKHJlc19jdHgtPmlzX2F1ZGlvX2FjcXVpcmVkW2ldID09IGZh
bHNlKSB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
