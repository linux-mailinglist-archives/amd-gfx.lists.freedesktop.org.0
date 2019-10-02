Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538CC9089
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95216E1AA;
	Wed,  2 Oct 2019 18:16:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB4D6E1AA
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsBpqEGRDF+OVIqiKavi1BKwcI7KtKagXvB1LWvfjKgCLssOMawcwvpXkjWEMm5AQF2Levg2cCg+1aJbq38JcpbFVeG0o9Hv/ZfURs5lFU1kRH/MwQVvMZ3l26ZWDPXpIkrY8HeX01PR9dtUVpG3HugP5Bq12vM0dWGfiR60lrbWbTJvBnYu+AQM3Zc1jxI/aCe4ldXJN4xvKZe2VunSSG6MAEZdOf0kA78bFZ71bnOwis4DHb3uMZG9EfJ6I8gdnDq5htqxG6HSj+mRkblO05MRyiPLbNOYTSq/bx4J2uD3eAYqBww06xbmawJKWNEkRKJ7cgROo4BvZK5oMuZyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmgaQG2V+Nu12QHEcChmbeENA92RrKwqkTC3zIwBgYs=;
 b=QjnlbPhxrhWwGPecMtXgsAVhbUQS6ghtdm/2SQi0Hb2u9j2EmGKXfHzQShAcIMhaCQlsk0PR6pc0ZsmtnSTUTbkg45atuNm2FKFS1YQn9hO5Iod9jn/1MugvoZL3xCFr1jmQ+6o1hUX+Cd8NIuTDVgU2webx5pSRoKNTjipj6fykwu0YHNYSFn3JlV1Ul5Ox8R975c0lwrzUEl9RhP/bc3RY4YjLrgiI3gouYsE+zPfZVjJygT2af478R1HrO+F3oruPHMcwD7Su8IMH0Ji9MEGXOCzPhNkSqxl4a8CCTR+kOKt39uo9y2r0R960CVhf7cX+mKnlhySY+JMUYUePTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 MN2PR12MB3677.namprd12.prod.outlook.com (2603:10b6:208:15a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:41 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:40 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:38 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/38] drm/amd/display: add explicit comparator as default
 optimization check
Date: Wed, 2 Oct 2019 14:16:05 -0400
Message-ID: <20191002181633.22805-11-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(428003)(189003)(199004)(2906002)(6916009)(14444005)(2351001)(446003)(336012)(5660300002)(1076003)(305945005)(16586007)(50466002)(48376002)(356004)(6666004)(316002)(53416004)(50226002)(8936002)(8676002)(36756003)(126002)(47776003)(486006)(476003)(86362001)(26005)(478600001)(70586007)(70206006)(4326008)(51416003)(11346002)(7696005)(426003)(76176011)(186003)(81166006)(81156014)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3677; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c56b0069-f72b-4391-c1a3-08d74764abdb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3677:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36774C81D23B37A99A89F452F99C0@MN2PR12MB3677.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwbNa85iTVPpHMFv+t79OKcj8YISd3hJOs+1s7+d5HFLc3vEvcB3IodZtEXSZH150sRXZi+r2mpa5yHnZjLltU3wgzDaiK5Kd0QqG6GO4ate3tMAJkzmUW2uMnk5XA3fME8/pZHWQBKKZPT/ohnwzXQ9ZizESl9COF4myo+FUlvPk7Alf86xhDbBOyncDs5Onw5uuZz8zN/qyvz6KjAaHiIOmX3wzctuVXcdfxRlzLTz/hPC/8K1q2Elpz6WrNQMiUr8bmGgMDsc38aBf6q3nEfWVNuHWE7TM3cwVuA5epfMFwcaWSAEdJTMWhtQ29xp2wTcvLLwj6qsPkQhLwlhK+aPDwUiFYbuCmMdafSmkCLMPWxLkpJeQ7/ja6t+UwX4ecruLRgvE/lzE8uFckO1CV7A6T/a0GnzZCbwTutH9lY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:40.0581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c56b0069-f72b-4391-c1a3-08d74764abdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3677
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmgaQG2V+Nu12QHEcChmbeENA92RrKwqkTC3zIwBgYs=;
 b=hqOVdmUNVldIwysJpFbUYDrsSuIQ+KxYExkZZxC+BWg7IwA7MXxN/8TOozO08Z8QUtLyvXH3ok4WtCHrXpq1DwH82d2ADAJfJZThWaP2j4Hd3jT1hu360qt81YWgnowUbtqva8dBzA4QlmdpjgBprK3e6u/H9uYrLLfwAhRAX2Y=
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
Cc: Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KbWVtY21wIGlzIHZ1bG5lcmFi
bGUgdG8gcmVncmVzc2lvbiBkdWUgdG8gZGNfY2xvY2tzIHN0cnVjdHVyZXMgbm90IGJlaW5nCm9y
Z2FuaXplZCBwcm9wZXJseSAobm90ICJjdXJyZW50IiBjbG9jayByZWxhdGVkIHN0cnVjdHVyZXMg
YmVpbmcgYXQgdGhlIGJlZ2lubmluZwpvZiB0aGUgc3RydWN0dXJlKSBhbmQgY2F1c2VzIHVubmVj
ZXNzYXJ5IHNldHRpbmcgb2YgdGhlIG9wdGltaXplIGJpdAoKW2hvd10KYWRkIGEgZGNuIHNlcGNp
ZmljIGNvbXBhcmF0b3IsIGltcGxlbWVudCBmb3IgZGNuMgoKQ2hhbmdlLUlkOiBJNTUyNWVlOTEw
OTNlZDk3MjM1ZTFiODVhNzBlYTQxZTk1MjQwOTUzYgpTaWduZWQtb2ZmLWJ5OiBKdW4gTGVpIDxK
dW4uTGVpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1k
LmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQu
Y29tPgotLS0KIC4uLi9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jICB8
IDI0ICsrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjLmMgICAgICB8IDEyICsrKysrKysrLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9ody9jbGtfbWdyLmggICB8ICAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYwppbmRleCA1NTll
MTY5ODNmOTEuLmVjZDJjYjQ4NDBlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYwpAQCAtMzQ5
LDEyICszNDksMzYgQEAgdm9pZCBkY24yX2dldF9jbG9jayhzdHJ1Y3QgY2xrX21nciAqY2xrX21n
ciwKIAl9CiB9CiAKK3N0YXRpYyBib29sIGRjbjJfYXJlX2Nsb2NrX3N0YXRlc19lcXVhbChzdHJ1
Y3QgZGNfY2xvY2tzICphLAorCQlzdHJ1Y3QgZGNfY2xvY2tzICpiKQoreworCWlmIChhLT5kaXNw
Y2xrX2toeiAhPSBiLT5kaXNwY2xrX2toeikKKwkJcmV0dXJuIGZhbHNlOworCWVsc2UgaWYgKGEt
PmRwcGNsa19raHogIT0gYi0+ZHBwY2xrX2toeikKKwkJcmV0dXJuIGZhbHNlOworCWVsc2UgaWYg
KGEtPmRjZmNsa19raHogIT0gYi0+ZGNmY2xrX2toeikKKwkJcmV0dXJuIGZhbHNlOworCWVsc2Ug
aWYgKGEtPnNvY2Nsa19raHogIT0gYi0+c29jY2xrX2toeikKKwkJcmV0dXJuIGZhbHNlOworCWVs
c2UgaWYgKGEtPmRjZmNsa19kZWVwX3NsZWVwX2toeiAhPSBiLT5kY2ZjbGtfZGVlcF9zbGVlcF9r
aHopCisJCXJldHVybiBmYWxzZTsKKwllbHNlIGlmIChhLT5waHljbGtfa2h6ICE9IGItPnBoeWNs
a19raHopCisJCXJldHVybiBmYWxzZTsKKwllbHNlIGlmIChhLT5kcmFtY2xrX2toeiAhPSBiLT5k
cmFtY2xrX2toeikKKwkJcmV0dXJuIGZhbHNlOworCWVsc2UgaWYgKGEtPnBfc3RhdGVfY2hhbmdl
X3N1cHBvcnQgIT0gYi0+cF9zdGF0ZV9jaGFuZ2Vfc3VwcG9ydCkKKwkJcmV0dXJuIGZhbHNlOwor
CisJcmV0dXJuIHRydWU7Cit9CisKIHN0YXRpYyBzdHJ1Y3QgY2xrX21ncl9mdW5jcyBkY24yX2Z1
bmNzID0gewogCS5nZXRfZHBfcmVmX2Nsa19mcmVxdWVuY3kgPSBkY2UxMl9nZXRfZHBfcmVmX2Zy
ZXFfa2h6LAogCS51cGRhdGVfY2xvY2tzID0gZGNuMl91cGRhdGVfY2xvY2tzLAogCS5pbml0X2Ns
b2NrcyA9IGRjbjJfaW5pdF9jbG9ja3MsCiAJLmVuYWJsZV9wbWVfd2EgPSBkY24yX2VuYWJsZV9w
bWVfd2EsCiAJLmdldF9jbG9jayA9IGRjbjJfZ2V0X2Nsb2NrLAorCS5hcmVfY2xvY2tfc3RhdGVz
X2VxdWFsID0gZGNuMl9hcmVfY2xvY2tfc3RhdGVzX2VxdWFsLAogfTsKIAogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCBhNTZhOTg5ZWU2MDcuLjdhYzY4ZTc3
YjMyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC0xNjgx
LDggKzE2ODEsMTYgQEAgZW51bSBzdXJmYWNlX3VwZGF0ZV90eXBlIGRjX2NoZWNrX3VwZGF0ZV9z
dXJmYWNlc19mb3Jfc3RyZWFtKAogCQkJdXBkYXRlc1tpXS5zdXJmYWNlLT51cGRhdGVfZmxhZ3Mu
cmF3ID0gMHhGRkZGRkZGRjsKIAl9CiAKLQlpZiAodHlwZSA9PSBVUERBVEVfVFlQRV9GQVNUICYm
IG1lbWNtcCgmZGMtPmN1cnJlbnRfc3RhdGUtPmJ3X2N0eC5idy5kY24uY2xrLCAmZGMtPmNsa19t
Z3ItPmNsa3MsIG9mZnNldG9mKHN0cnVjdCBkY19jbG9ja3MsIHByZXZfcF9zdGF0ZV9jaGFuZ2Vf
c3VwcG9ydCkpICE9IDApCi0JCWRjLT5vcHRpbWl6ZWRfcmVxdWlyZWQgPSB0cnVlOworCWlmICh0
eXBlID09IFVQREFURV9UWVBFX0ZBU1QpIHsKKwkJLy8gSWYgdGhlcmUncyBhbiBhdmFpbGFibGUg
Y2xvY2sgY29tcGFyYXRvciwgd2UgdXNlIHRoYXQuCisJCWlmIChkYy0+Y2xrX21nci0+ZnVuY3Mt
PmFyZV9jbG9ja19zdGF0ZXNfZXF1YWwpIHsKKwkJCWlmICghZGMtPmNsa19tZ3ItPmZ1bmNzLT5h
cmVfY2xvY2tfc3RhdGVzX2VxdWFsKCZkYy0+Y2xrX21nci0+Y2xrcywgJmRjLT5jdXJyZW50X3N0
YXRlLT5id19jdHguYncuZGNuLmNsaykpCisJCQkJZGMtPm9wdGltaXplZF9yZXF1aXJlZCA9IHRy
dWU7CisJCS8vIEVsc2Ugd2UgZmFsbGJhY2sgdG8gbWVtIGNvbXBhcmUuCisJCX0gZWxzZSBpZiAo
bWVtY21wKCZkYy0+Y3VycmVudF9zdGF0ZS0+YndfY3R4LmJ3LmRjbi5jbGssICZkYy0+Y2xrX21n
ci0+Y2xrcywgb2Zmc2V0b2Yoc3RydWN0IGRjX2Nsb2NrcywgcHJldl9wX3N0YXRlX2NoYW5nZV9z
dXBwb3J0KSkgIT0gMCkgeworCQkJZGMtPm9wdGltaXplZF9yZXF1aXJlZCA9IHRydWU7CisJCX0K
Kwl9CiAKIAlyZXR1cm4gdHlwZTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9pbmMvaHcvY2xrX21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9ody9jbGtfbWdyLmgKaW5kZXggNzZmOWFkMWIyM2RmLi4yZmRkMGJhOTNiZWIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21nci5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21nci5oCkBA
IC0xODAsNiArMTgwLDkgQEAgc3RydWN0IGNsa19tZ3JfZnVuY3MgewogCQkJc3RydWN0IGRjX3N0
YXRlICpjb250ZXh0LAogCQkJZW51bSBkY19jbG9ja190eXBlIGNsb2NrX3R5cGUsCiAJCQlzdHJ1
Y3QgZGNfY2xvY2tfY29uZmlnICpjbG9ja19jZmcpOworCisJYm9vbCAoKmFyZV9jbG9ja19zdGF0
ZXNfZXF1YWwpIChzdHJ1Y3QgZGNfY2xvY2tzICphLAorCQkJc3RydWN0IGRjX2Nsb2NrcyAqYik7
CiB9OwogCiBzdHJ1Y3QgY2xrX21nciB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
