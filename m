Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4143BC909F
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4276E981;
	Wed,  2 Oct 2019 18:17:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E366E97E
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHJiSL56eXj9ME4IR56AiEcM5RC1bMquDEkcVZehDEghmQfmgJmldmMMymCyFTwpCPJ8ujDwK6T+wRcfm3OVy+4kWgnnVw3oUKBdEBvCDBfJDajbmnv9Mc8A6TcQDnLEcFQsgseXCeeo0kFi+acor9ixk1LgC7PS5UL5WdDRLwXZAYyCIfLz7l/yiPNEB8H6XcaQ+cFxIieVR3ogM0hVkmzMLzzNQC44MJD0VM7cmKdW1bBD7uxs+TUilfQ+aPuxKDwWxI5HtZKtLnyf1PV/CICfPMIFVjE+glrHLYn5Krqx+g8813w6TysYnO7SlaULBGRp56Wr+F2jMXhvQugUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeOrXb2OtfSvBov7XrVc2gZBbwtouuO2oxLU5Vq5mbE=;
 b=DblLmKvj0UeKHUn9jXni7gRFB69txDU83BfhAk85v0KmThAzcXCd7E/3t3ePmd5hvKXFdYegYv4sCrVvgU5UVfQEtvxiGt6JvGKVQUes7+OGECRaitWtN5xz0aQXXNsgFrqatOxO7zs2w+JPTM92nK11/rZ2p8HqC2N6gU5hw+EjCK/gCb6MBcZaNaavUWsKqcclCQ0WH6/cZWz3ZSMr7pfm/UbO5Sdybjvz0EwJgpHQnbxX8VnCVRrsBn5yFj4SgwMZDSOJA02pP/CZppiSXgvnPIXroeWwDrkSzh/3nuHQ7LV0Ft4qJGNIVbr5ycyjN7c2g6umCkovrOjTjEDHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 CY4PR12MB1799.namprd12.prod.outlook.com (2603:10b6:903:11c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 18:16:56 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:56 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:55 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 37/38] drm/amd/display: hook up notify watermark ranges and
 get clock table
Date: Wed, 2 Oct 2019 14:16:32 -0400
Message-ID: <20191002181633.22805-38-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(428003)(199004)(189003)(51416003)(316002)(86362001)(478600001)(1076003)(36756003)(6666004)(305945005)(47776003)(2351001)(16586007)(6916009)(336012)(5660300002)(11346002)(126002)(76176011)(356004)(476003)(446003)(53416004)(70206006)(426003)(2616005)(48376002)(26005)(70586007)(50466002)(2906002)(4326008)(186003)(486006)(8676002)(81156014)(8936002)(81166006)(14444005)(50226002)(7696005)(52103002)(158003001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1799; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 498cb587-8a12-4d6b-3d2a-08d74764b58e
X-MS-TrafficTypeDiagnostic: CY4PR12MB1799:
X-Microsoft-Antispam-PRVS: <CY4PR12MB179974126F69E2C4998440C4F99C0@CY4PR12MB1799.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZjH/icfxVZd+d+5a9LwN6kB3Bx94cbdw+FspCdyqh7/MxtzYWlFOPzE9l/bT6Me4VKa9z/RuBlT8mHEttLkZP+cbi9e9GIIrpdKBKbfvQoghj1aL0wrEcZoFuqgQG2iYB6RuH18C4jyufOFFq0D9z4dE8RrzDYSmeDybrS+9D6GagfuhUuIBXrPfyEU+cG/Ed7M9Tbub2I7EogguDq419ZPJmUzuyNhqauy7pO+NwlDHwCwETEcbQMNAmNSOUbhbTSBsJxsH7MoXhFbbXrsl6W99PtNpCycxxmuh75iBUvVgOUkov8lXXRWFzcIEBLPOr/HSnPy6/FVkIzlnMRC8NVieS7brtvc5s4OYlfbHMiJyMFOKXWf7C1uPvOAk+bgvB2gU7FpDhTboq34kKu1VjOQU300MkchGGYqeIIWv238=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:56.2962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 498cb587-8a12-4d6b-3d2a-08d74764b58e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1799
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeOrXb2OtfSvBov7XrVc2gZBbwtouuO2oxLU5Vq5mbE=;
 b=nv7jcScpSIgWt4LfLrnu9onrqWCXTdycRCvvJ5RvFZK1q6mU+jtvc1glQq3uCB5oAZY7jSSjK8cOq8P/6ZNy1xLgJWv11dGOSQgNfq8Xc7fYUvGd4nW6PBDlYjJfFytgQGK7xgOPZLjpikIKUzCZ2MNFpW0atN4mvkTWY17CIJY=
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
Cc: Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpQcmV2aW91c2x5IFNN
VSB3YXMgZ2l2aW5nIHVzIDBzIGZvciB0aGUgY2xvY2sgdGFibGUuIE5vdyB0aGV5IGhhdmUgdmFs
aWQKY2xvY2sgdGFibGUuIFdlIHNob3VsZCB1c2UgdGhlaXJzLiBBbHNvLCBuZWVkIHRvIHNlbmQg
U01VIHdhdGVybWFyawpyYW5nZXMgZm9yIHNlbGVjdGluZyBvcHRpbWFsIHdhdGVybWFya3MuCgpD
aGFuZ2UtSWQ6IEk1OWNlZmQzNDNkZGI3ZWJmMDAxNjQ4NTRjNmI0MzQwN2U3YzA3YzRlClNpZ25l
ZC1vZmYtYnk6IEVyaWMgWWFuZyA8RXJpYy5ZYW5nMkBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyB8IDQ0ICsrKysrKysrKysrKysrKy0t
LS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyB8IDE2ICsr
KysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNu
MjEvcm5fY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3Iv
ZGNuMjEvcm5fY2xrX21nci5jCmluZGV4IGNhZTZhNmY1NDA1ZC4uZjBmNmI5ZmUzZjQ5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9j
bGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNu
MjEvcm5fY2xrX21nci5jCkBAIC01MjksMjIgKzUyOSw0OCBAQCB2b2lkIGJ1aWxkX3dhdGVybWFy
a19yYW5nZXMoc3RydWN0IGNsa19id19wYXJhbXMgKmJ3X3BhcmFtcywgc3RydWN0IHBwX3NtdV93
bV9yYQogCiB9CiAKLXZvaWQgY2xrX21ncl9oZWxwZXJfcG9wdWxhdGVfYndfcGFyYW1zKHN0cnVj
dCBjbGtfYndfcGFyYW1zICpid19wYXJhbXMsIHN0cnVjdCBkcG1fY2xvY2tzICpjbG9ja190YWJs
ZSwgc3RydWN0IGh3X2FzaWNfaWQgKmFzaWNfaWQpCit1bnNpZ25lZCBpbnQgZmluZF9kY2ZjbGtf
Zm9yX3ZvbHRhZ2Uoc3RydWN0IGRwbV9jbG9ja3MgKmNsb2NrX3RhYmxlLCB1bnNpZ25lZCBpbnQg
dm9sdGFnZSkKIHsKIAlpbnQgaTsKIAorCWZvciAoaSA9IDA7IGkgPCBQUF9TTVVfTlVNX0RDRkNM
S19EUE1fTEVWRUxTOyBpKyspIHsKKwkJaWYgKGNsb2NrX3RhYmxlLT5EY2ZDbG9ja3NbaV0uVm9s
ID09IHZvbHRhZ2UpCisJCQlyZXR1cm4gY2xvY2tfdGFibGUtPkRjZkNsb2Nrc1tpXS5GcmVxOwor
CX0KKworCUFTU0VSVCgwKTsKKwlyZXR1cm4gMDsKK30KKwordm9pZCBjbGtfbWdyX2hlbHBlcl9w
b3B1bGF0ZV9id19wYXJhbXMoc3RydWN0IGNsa19id19wYXJhbXMgKmJ3X3BhcmFtcywgc3RydWN0
IGRwbV9jbG9ja3MgKmNsb2NrX3RhYmxlLCBzdHJ1Y3QgaHdfYXNpY19pZCAqYXNpY19pZCkKK3sK
KwlpbnQgaSwgajsKKwogCUFTU0VSVChQUF9TTVVfTlVNX0ZDTEtfRFBNX0xFVkVMUyA8PSBNQVhf
TlVNX0RQTV9MVkwpOwogCi0JZm9yIChpID0gMDsgaSA8IFBQX1NNVV9OVU1fRkNMS19EUE1fTEVW
RUxTOyBpKyspIHsKLQkJaWYgKGNsb2NrX3RhYmxlLT5GQ2xvY2tzW2ldLkZyZXEgPT0gMCkKKwkv
KiBGaW5kIGxvd2VzdCBEUE0sIEZDTEsgaXMgZmlsbGVkIGluIHJldmVyc2Ugb3JkZXIqLworCisJ
Zm9yIChpID0gUFBfU01VX05VTV9GQ0xLX0RQTV9MRVZFTFMgLSAxOyBpID49IDA7IGktLSkgewor
CQlpZiAoY2xvY2tfdGFibGUtPkZDbG9ja3NbaV0uRnJlcSAhPSAwKSB7CisJCQlqID0gaTsKIAkJ
CWJyZWFrOworCQl9CisJfQogCi0JCWJ3X3BhcmFtcy0+Y2xrX3RhYmxlLmVudHJpZXNbaV0uZGNm
Y2xrX21oeiA9IGNsb2NrX3RhYmxlLT5EY2ZDbG9ja3NbaV0uRnJlcTsKLQkJYndfcGFyYW1zLT5j
bGtfdGFibGUuZW50cmllc1tpXS5mY2xrX21oeiA9IGNsb2NrX3RhYmxlLT5GQ2xvY2tzW2ldLkZy
ZXE7Ci0JCWJ3X3BhcmFtcy0+Y2xrX3RhYmxlLmVudHJpZXNbaV0ubWVtY2xrX21oeiA9IGNsb2Nr
X3RhYmxlLT5NZW1DbG9ja3NbaV0uRnJlcTsKLQkJYndfcGFyYW1zLT5jbGtfdGFibGUuZW50cmll
c1tpXS5zb2NjbGtfbWh6ID0gY2xvY2tfdGFibGUtPlNvY0Nsb2Nrc1tpXS5GcmVxOwotCQlid19w
YXJhbXMtPmNsa190YWJsZS5lbnRyaWVzW2ldLnZvbHRhZ2UgPSBjbG9ja190YWJsZS0+RkNsb2Nr
c1tpXS5Wb2w7CisJZm9yIChpID0gMDsgaSA8IFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTOyBp
KyspIHsKKwkJaWYgKGogPCAwKSB7CisJCQkvKiBJbnZhbGlkIGVudHJpZXMgKi8KKwkJCWJ3X3Bh
cmFtcy0+Y2xrX3RhYmxlLmVudHJpZXNbaV0uZmNsa19taHogPSAwOworCQkJY29udGludWU7CisJ
CX0KKwkJYndfcGFyYW1zLT5jbGtfdGFibGUuZW50cmllc1tpXS5mY2xrX21oeiA9IGNsb2NrX3Rh
YmxlLT5GQ2xvY2tzW2pdLkZyZXE7CisJCWJ3X3BhcmFtcy0+Y2xrX3RhYmxlLmVudHJpZXNbaV0u
bWVtY2xrX21oeiA9IGNsb2NrX3RhYmxlLT5NZW1DbG9ja3Nbal0uRnJlcTsKKwkJYndfcGFyYW1z
LT5jbGtfdGFibGUuZW50cmllc1tpXS52b2x0YWdlID0gY2xvY2tfdGFibGUtPkZDbG9ja3Nbal0u
Vm9sOworCQlid19wYXJhbXMtPmNsa190YWJsZS5lbnRyaWVzW2ldLmRjZmNsa19taHogPSBmaW5k
X2RjZmNsa19mb3Jfdm9sdGFnZShjbG9ja190YWJsZSwgY2xvY2tfdGFibGUtPkZDbG9ja3Nbal0u
Vm9sKTsKKwkJai0tOwogCX0KKworCiAJYndfcGFyYW1zLT5jbGtfdGFibGUubnVtX2VudHJpZXMg
PSBpOwogCiAJYndfcGFyYW1zLT52cmFtX3R5cGUgPSBhc2ljX2lkLT52cmFtX3R5cGU7CkBAIC01
NTMsNyArNTc5LDcgQEAgdm9pZCBjbGtfbWdyX2hlbHBlcl9wb3B1bGF0ZV9id19wYXJhbXMoc3Ry
dWN0IGNsa19id19wYXJhbXMgKmJ3X3BhcmFtcywgc3RydWN0IGQKIAlmb3IgKGkgPSAwOyBpIDwg
V01fU0VUX0NPVU5UOyBpKyspIHsKIAkJYndfcGFyYW1zLT53bV90YWJsZS5lbnRyaWVzW2ldLndt
X2luc3QgPSBpOwogCi0JCWlmIChjbG9ja190YWJsZS0+RkNsb2Nrc1tpXS5GcmVxID09IDApIHsK
KwkJaWYgKGkgPj0gYndfcGFyYW1zLT5jbGtfdGFibGUubnVtX2VudHJpZXMpIHsKIAkJCWJ3X3Bh
cmFtcy0+d21fdGFibGUuZW50cmllc1tpXS52YWxpZCA9IGZhbHNlOwogCQkJY29udGludWU7CiAJ
CX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24y
MV9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIx
X3Jlc291cmNlLmMKaW5kZXggY2I0NjlmMzdjMWViLi41NDg2ZmM2MTIwNzcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5j
CkBAIC0xMzM0LDEwICsxMzM0LDIwIEBAIHN0cnVjdCBwcF9zbXVfZnVuY3MgKmRjbjIxX3BwX3Nt
dV9jcmVhdGUoc3RydWN0IGRjX2NvbnRleHQgKmN0eCkKIHsKIAlzdHJ1Y3QgcHBfc211X2Z1bmNz
ICpwcF9zbXUgPSBremFsbG9jKHNpemVvZigqcHBfc211KSwgR0ZQX0tFUk5FTCk7CiAKLQlwcF9z
bXUtPmN0eC52ZXIgPSBQUF9TTVVfVkVSX1JOOworCWlmICghcHBfc211KQorCQlyZXR1cm4gcHBf
c211OwogCi0JcHBfc211LT5ybl9mdW5jcy5nZXRfZHBtX2Nsb2NrX3RhYmxlID0gZHVtbXlfZ2V0
X2RwbV9jbG9ja190YWJsZTsKLQlwcF9zbXUtPnJuX2Z1bmNzLnNldF93bV9yYW5nZXMgPSBkdW1t
eV9zZXRfd21fcmFuZ2VzOworCWlmIChJU19GUEdBX01BWElNVVNfREMoY3R4LT5kY2VfZW52aXJv
bm1lbnQpKSB7CisJCXBwX3NtdS0+Y3R4LnZlciA9IFBQX1NNVV9WRVJfUk47CisJCXBwX3NtdS0+
cm5fZnVuY3MuZ2V0X2RwbV9jbG9ja190YWJsZSA9IGR1bW15X2dldF9kcG1fY2xvY2tfdGFibGU7
CisJCXBwX3NtdS0+cm5fZnVuY3Muc2V0X3dtX3JhbmdlcyA9IGR1bW15X3NldF93bV9yYW5nZXM7
CisJfSBlbHNlIHsKKworCQlkbV9wcF9nZXRfZnVuY3MoY3R4LCBwcF9zbXUpOworCisJCWlmIChw
cF9zbXUtPmN0eC52ZXIgIT0gUFBfU01VX1ZFUl9STikKKwkJCXBwX3NtdSA9IG1lbXNldChwcF9z
bXUsIDAsIHNpemVvZihzdHJ1Y3QgcHBfc211X2Z1bmNzKSk7CisJfQogCiAJcmV0dXJuIHBwX3Nt
dTsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
