Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8172FAEC6B
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D3C8944A;
	Tue, 10 Sep 2019 13:55:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B609A892D5
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgfjJMkn55VOb33ig2VocDJBjASfCQpdrMkYXYc9aIM/gXgR0sJDdo6lq3PEMFsL+I+FG2D06N0es3R0sDbRnZ/rKLAkzVCB4Dz59Klwa+dlsq1UCvIzcfZlxLypTVSigtXO1oZQ+gYO8N3ZtHOep4XQNabk91Ck3zvxPnoe7/RjW8shRVn6JSSyhcItJ61jPMyw1jlZ2BB635dckziY7DMFrygK3OrRWzk4rFrMfMDcH4IWPJYnhM810HIWssw5XGjQg7z0uGLLhyPt1F4Ul3g5l25xgmqSgLRcl8WADe2ievDy5T76HQ8/o/OryhMzRm6lPRthcfD7UVTUbJHdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgSU7X2NsM1UHlxpDAP9a8jp/jklD5GszhodbN1X//s=;
 b=Kmi7AAODvNA+8a524AyMp55MvGQmjpcUg/CsHOLwPt0Jfww+d2IVW3/rhtc26FQfkmhClq2bEq+FWGVGuW7O9YzPdJaSUOnKDKew6pRM6G6Fh/t2M/8VX7zpR3WU4f4zlEiaHTdBmuiRH7/T0xWsLCb6zvmbVANwi/bHw3BsJgl08jC8kKJMXktCXLQ9fwb05MCugC6gVCDZ+LDerO+gJ6uJXVvxmrimNq8zrNQZb9ZrRVR5omqLQe2FukOgp5g30aGIpnvRBZfmrrEmEkT4+SjRaSDIgIKb6Oq1Mw9ioiZvdUTqxqR82Djjk87S0pUYEhtRgIW39PPIBbalpw6Eew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by BN7PR12MB2658.namprd12.prod.outlook.com (2603:10b6:408:25::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.20; Tue, 10 Sep
 2019 13:55:01 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:01 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:55 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/25] drm/amd/display: Add debugfs entry to force YUV420
 output
Date: Tue, 10 Sep 2019 09:54:27 -0400
Message-ID: <20190910135445.18300-8-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(2906002)(11346002)(1076003)(86362001)(5660300002)(81166006)(81156014)(8676002)(14444005)(8936002)(50226002)(6916009)(2351001)(2876002)(70206006)(70586007)(53936002)(48376002)(186003)(6666004)(126002)(356004)(50466002)(26005)(47776003)(478600001)(2616005)(486006)(336012)(476003)(316002)(446003)(4326008)(76176011)(49486002)(2870700001)(305945005)(54906003)(36756003)(426003)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2658; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 165aecaa-2073-4fba-271f-08d735f67986
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2658; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2658:
X-Microsoft-Antispam-PRVS: <BN7PR12MB26587D2DD34FD6DF7E6BEEAA82B60@BN7PR12MB2658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +btMeDQoSnKDQPQ5OpXWBVkvf3W4G8kpLymq5zBa9cZzQunYOBC+J82AbsWwxodrlTticq9w6qesSS0YhhsawP8Q+IoBJO46Dru5jp3nOlwcKbgcPEitQ4snAfb9wMVxkswiP2/MAz2enh3T+eiHxsDEqI2Nu3elimK6cMmVNibtCROUXdtVUj0QfQB3sgTMKjGrrLRsrtDi08nXo7TCypthCnRJY+nNd1kMPcZ9qARIJkva+OvP9BOA2YODwAti3IKPXzqeXKfjZpr3/G60kSFmwK3dwyRs99MNR9ZRWjgq5+0nlzz/pnFRk/teBB0rOFl6hxmHPKzSSqeJSYsgnjP+efCC/0t+Ohd+GT2Y/NK/aGJF3n8eipk91LNg1UgbQFCsEULM3zHjk/v6Xxr5B5GrQqN+kQ91JXyIvr3Iw4c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:01.1384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 165aecaa-2073-4fba-271f-08d735f67986
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2658
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgSU7X2NsM1UHlxpDAP9a8jp/jklD5GszhodbN1X//s=;
 b=XQ0pZpxhS8mE4Q26KCvEwNcoFz4z1/Fik6A5jlP5OqXveY8H7gz5v8ZLoCV1R1On+oXbSaZ21ONSIXTjYnm3UlyA8hXjVQdSgw6XcZoJCtVd1aZcHfJA5CP5FXNdzBh1nFQVyPm0DF9CUgV8u88kG34JLkgAejKD+POhVlHDGXU=
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
Cc: Stylon Wang <stylon.wang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3R5bG9uIFdhbmcgPHN0eWxvbi53YW5nQGFtZC5jb20+CgpbV2h5XQpFdmVuIGlmIFlV
VjQyMCBpcyBhdmFpbGFibGUgZm9yIHZpZGVvIG1vZGUsIFlVVjQ0NCBpcyBzdGlsbAphdXRvbWF0
aWNhbGx5IHNlbGVjdGVkLiBUaGlzIHBvc2VzIGEgcHJvYmxlbSBmb3IgY29tcGxpYW5jZSB0ZXN0
cy4KCltIb3ddCkFkZCBhIHBlci1jb25uZWN0b3IgZGVidWdmcyBlbnRyeSAiZm9yY2VfeXV2NDIw
X291dHB1dCIgdG8gZm9yY2UKc2VsZWN0aW9uIG9mIFlVVjQyMCBtb2RlLgoKU2lnbmVkLW9mZi1i
eTogU3R5bG9uIFdhbmcgPHN0eWxvbi53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBOaWNob2xh
cyBLYXpsYXVza2FzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgfCAgNSArKy0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uaCB8ICAxICsKIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2RlYnVnZnMuYyB8IDMxICsrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwg
MzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGMxMDMxMTIxZWU4YS4uZjlj
MTNkY2NmYzAzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKQEAgLTMzODMsNyArMzM4Myw3IEBAIHN0YXRpYyB2b2lkIGZpbGxfc3Ry
ZWFtX3Byb3BlcnRpZXNfZnJvbV9kcm1fZGlzcGxheV9tb2RlKAogewogCXN0cnVjdCBkY19jcnRj
X3RpbWluZyAqdGltaW5nX291dCA9ICZzdHJlYW0tPnRpbWluZzsKIAljb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfaW5mbyAqaW5mbyA9ICZjb25uZWN0b3ItPmRpc3BsYXlfaW5mbzsKLQorCXN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rv
cihjb25uZWN0b3IpOwogCW1lbXNldCh0aW1pbmdfb3V0LCAwLCBzaXplb2Yoc3RydWN0IGRjX2Ny
dGNfdGltaW5nKSk7CiAKIAl0aW1pbmdfb3V0LT5oX2JvcmRlcl9sZWZ0ID0gMDsKQEAgLTMzOTQs
NiArMzM5NCw5IEBAIHN0YXRpYyB2b2lkIGZpbGxfc3RyZWFtX3Byb3BlcnRpZXNfZnJvbV9kcm1f
ZGlzcGxheV9tb2RlKAogCWlmIChkcm1fbW9kZV9pc180MjBfb25seShpbmZvLCBtb2RlX2luKQog
CQkJJiYgc3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZUEVfSERNSV9UWVBFX0EpCiAJCXRpbWlu
Z19vdXQtPnBpeGVsX2VuY29kaW5nID0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjA7CisJZWxzZSBp
ZiAoZHJtX21vZGVfaXNfNDIwX2Fsc28oaW5mbywgbW9kZV9pbikKKwkJCSYmIGFjb25uZWN0b3It
PmZvcmNlX3l1djQyMF9vdXRwdXQpCisJCXRpbWluZ19vdXQtPnBpeGVsX2VuY29kaW5nID0gUElY
RUxfRU5DT0RJTkdfWUNCQ1I0MjA7CiAJZWxzZSBpZiAoKGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZv
LmNvbG9yX2Zvcm1hdHMgJiBEUk1fQ09MT1JfRk9STUFUX1lDUkNCNDQ0KQogCQkJJiYgc3RyZWFt
LT5zaWduYWwgPT0gU0lHTkFMX1RZUEVfSERNSV9UWVBFX0EpCiAJCXRpbWluZ19vdXQtPnBpeGVs
X2VuY29kaW5nID0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0NDQ7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaAppbmRleCBjYmQ2NjA4ZjU4ZTYu
LjE3YTM1YjUwNDU1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5oCkBAIC0yODQsNiArMjg0LDcgQEAgc3RydWN0IGFtZGdwdV9kbV9j
b25uZWN0b3IgewogCXVpbnQzMl90IGRlYnVnZnNfZHBjZF9hZGRyZXNzOwogCXVpbnQzMl90IGRl
YnVnZnNfZHBjZF9zaXplOwogI2VuZGlmCisJYm9vbCBmb3JjZV95dXY0MjBfb3V0cHV0OwogfTsK
IAogI2RlZmluZSB0b19hbWRncHVfZG1fY29ubmVjdG9yKHgpIGNvbnRhaW5lcl9vZih4LCBzdHJ1
Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciwgYmFzZSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYwppbmRleCA5N2Ji
YjkzNGNjMDQuLmI5OWJlMzg1ZWVhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2RlYnVnZnMuYwpAQCAtOTQwLDYgKzk0
MCwzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHsKIAkJeyJhdXhfZHBjZF9kYXRhIiwgJmRwX2Rw
Y2RfZGF0YV9kZWJ1Z2ZzX2ZvcHN9CiB9OwogCisvKgorICogRm9yY2UgWVVWNDIwIG91dHB1dCBp
ZiBhdmFpbGFibGUgZnJvbSB0aGUgZ2l2ZW4gbW9kZQorICovCitzdGF0aWMgaW50IGZvcmNlX3l1
djQyMF9vdXRwdXRfc2V0KHZvaWQgKmRhdGEsIHU2NCB2YWwpCit7CisJc3RydWN0IGFtZGdwdV9k
bV9jb25uZWN0b3IgKmNvbm5lY3RvciA9IGRhdGE7CisKKwljb25uZWN0b3ItPmZvcmNlX3l1djQy
MF9vdXRwdXQgPSAoYm9vbCl2YWw7CisKKwlyZXR1cm4gMDsKK30KKworLyoKKyAqIENoZWNrIGlm
IFlVVjQyMCBpcyBmb3JjZWQgd2hlbiBhdmFpbGFibGUgZnJvbSB0aGUgZ2l2ZW4gbW9kZQorICov
CitzdGF0aWMgaW50IGZvcmNlX3l1djQyMF9vdXRwdXRfZ2V0KHZvaWQgKmRhdGEsIHU2NCAqdmFs
KQoreworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICpjb25uZWN0b3IgPSBkYXRhOworCisJ
KnZhbCA9IGNvbm5lY3Rvci0+Zm9yY2VfeXV2NDIwX291dHB1dDsKKworCXJldHVybiAwOworfQor
CitERUZJTkVfREVCVUdGU19BVFRSSUJVVEUoZm9yY2VfeXV2NDIwX291dHB1dF9mb3BzLCBmb3Jj
ZV95dXY0MjBfb3V0cHV0X2dldCwKKwkJCSBmb3JjZV95dXY0MjBfb3V0cHV0X3NldCwgIiVsbHVc
biIpOworCiB2b2lkIGNvbm5lY3Rvcl9kZWJ1Z2ZzX2luaXQoc3RydWN0IGFtZGdwdV9kbV9jb25u
ZWN0b3IgKmNvbm5lY3RvcikKIHsKIAlpbnQgaTsKQEAgLTk1Myw2ICs5ODAsMTAgQEAgdm9pZCBj
b25uZWN0b3JfZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICpjb25uZWN0
b3IpCiAJCQkJCSAgICBkcF9kZWJ1Z2ZzX2VudHJpZXNbaV0uZm9wcyk7CiAJCX0KIAl9CisKKwlk
ZWJ1Z2ZzX2NyZWF0ZV9maWxlX3Vuc2FmZSgiZm9yY2VfeXV2NDIwX291dHB1dCIsIDA2NDQsIGRp
ciwgY29ubmVjdG9yLAorCQkJCSAgICZmb3JjZV95dXY0MjBfb3V0cHV0X2ZvcHMpOworCiB9CiAK
IC8qCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
